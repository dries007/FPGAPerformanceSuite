PART_V = 'xc7k410tfbg900-1'
PART_N = 'NG-MEDIUM'


@runner(NanoXplore, single_thread=True)
def nx_math_runner():
    for n in (8, 16, 32, 64, 128, 256):
        yield dict(name='add%d' % n, part=PART_N, files=('../vhdl/add_nx.vhd',), generics={'N': n}, path=NX_PATH)


@runner(Vivado)
def vivado_math_runner():
    for n in (8, 16, 32, 64, 128, 256):
        yield dict(name='add%d' % n, part=PART_V, files=('../vhdl/add.vhd',), generics={'N': n})


@runner(Vivado)
def vivado_iscas89_runner():
    """
    Set for all .vhd files in ../iscas89/vhdl/
    """
    files = list(helpers.natural_sort(glob.iglob('../iscas89/vhdl/*.vhd')))
    logging.debug('ISCAS89 files: %r', files)
    for file in files:
        name = os.path.splitext(os.path.basename(file))[0]
        yield dict(name=name, top=name, part=PART_V, files=[file])


@runner(NanoXplore, single_thread=True)
def nx_iscas89_runner():
    """
    Set for all .vhd files in ../iscas89/vhdl/
    """
    files = list(helpers.natural_sort(glob.iglob('../iscas89/vhdl/*.vhd')))
    logging.debug('ISCAS89 files: %r', files)
    for file in files:
        name = os.path.splitext(os.path.basename(file))[0]
        yield dict(name=name, part=PART_N, top=name, files=(file,), path=NX_PATH)


@runner(Vivado)
def vivado_fir_s832_runner():
    """
    Complex example with multiple control structures.
    This runner was used to generate the results in the thesis.
    The reason for the complexity is that we didn't know how long the tasks
    would take. With limited compute time available this prioritizes some
    data points over others. Priority high -> low:

    1. 1 -> 25 FIR filters with 1% -> 51% background filler in steps of 10%
    2. 1 -> 25 FIR filters with 1% -> 51% background filler in steps of 5%
    3. 1 -> 25 FIR filters with 1% -> 71% background filler in steps of 10%
    4. 1 -> 25 FIR filters with 1% -> 76% background filler in steps of 5%
    5. 1 -> 50 FIR filters with 1% -> 51% background filler in steps of 10%
    6. 1 -> 50 FIR filters with 1% -> 51% background filler in steps of 5%
    
    All combinations with an expected fill rate over 90% are skipped.
    The FIR filter takes 2.3%, the filler 0.1% per instance.
    """
    # List of files we need.
    files = ['../iscas89/vhdl/s832.vhd'] + FIR_FILES + TOP_FILES
    logging.debug('vivado_fir_s298_runner files: %r', files)

    pairs = []

    # NA = number of design A = FIR filter
    # NB = number of design B = Filler
        for na in range(1, 26):
        for nb in range(10, 511, 100):
            if (na, nb) not in pairs:
                pairs.append((na, nb))
    for na in range(1, 26):
        for nb in range(10, 511, 50):
            if (na, nb) not in pairs:
                pairs.append((na, nb))
    for na in range(1, 26):
        for nb in range(10, 711, 100):
            if (na, nb) not in pairs:
                pairs.append((na, nb))
    for na in range(1, 26):
        for nb in range(10, 761, 50):
            if (na, nb) not in pairs:
                pairs.append((na, nb))
    for na in range(1, 51):
        for nb in range(10, 511, 100):
            if (na, nb) not in pairs:
                pairs.append((na, nb))
    for na in range(1, 51):
        for nb in range(10, 511, 50):
            if (na, nb) not in pairs:
                pairs.append((na, nb))
    logging.info('Que length without duplicates: %d', len(pairs))

    for na, nb in pairs:
        if 2.3 * na + 0.1 * nb > 90:
            continue
        name = '%dxFIR_%dxS832' % (na, nb)
        yield dict(name=name, top='top', part=PART_V, files=files, libraries=FIR_LIBS,
                   generics={'TAPS':129, 'COEF_BW':16, 'DATA_BW':16, 'N_A':na, 'N_B':nb})
