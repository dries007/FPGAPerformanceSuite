#!/bin/env python3

import collections
import json
import math
import re

import matplotlib.pyplot as plt
import pandas
from matplotlib.ticker import EngFormatter, PercentFormatter

LUTS_AVAILABLE = {
    'NG-MEDIUM': 34272,
    'xc7k410tfbg900-1': 254200
}

LINE_COLORS = 10
LINE_STYLES = ['-', '-.', '--', ':']


def read_json(filename):
    with open(filename) as f:
        return json.load(f)


def write_json(filename, data):
    with open(filename, 'w') as f:
        return json.dump(data, f, indent='\t')


def _convert(text):
    return int(text) if text.isdigit() else text.lower()


def alphanum_key(key):
    return [_convert(c) for c in re.split('([0-9]+)', key)]


def accumulate_results(json_data, keys=('name', 'part', 'fmax', 'lut', 'registers', 'bram', 'dsp'), generics=()):
    data = collections.defaultdict(lambda: [])
    for item in json_data:
        for k in keys:
            data[k].append(item[k])
        for k, v in generics:
            data[v].append(item['generics'][k])
    df = pandas.DataFrame(data)
    df['luts_available'] = df['part'].map(LUTS_AVAILABLE)
    df['utilisation'] = 100 * df['lut'] / df['luts_available']
    df['fmax'] = df['fmax'] / 10 ** 6
    return df


def graph_fmax_sorted_by_part(name, df):
    df.to_csv(name + '.csv', index=False, sep=',', float_format='%.4f')
    fig, ax = plt.subplots(1, 1)

    for part, group in df.groupby('part'):
        group.plot.line('name', 'fmax', ax=ax, label=part)
        group.to_csv(name + '_' + part + '.csv', index=False, sep=',', float_format='%.4f')

    ax.legend(framealpha=1.0, title='Part')

    ax.set_yscale('log')
    ax.yaxis.grid(True, which='major', linestyle='-')
    ax.yaxis.grid(True, which='minor', linestyle=':')

    ax.set_xlabel('Benchmark')
    ax.set_xticks(range(len(df['name'].unique())))
    ax.set_xticklabels(df['name'].unique())

    ax.set_ylabel('F max')
    ax.yaxis.set_major_formatter(EngFormatter('MHz'))
    ax.yaxis.set_minor_formatter(EngFormatter('MHz'))

    fig.set_size_inches(10, 4)

    plt.tight_layout()
    plt.savefig(name + '.pdf')
    plt.show()


def graph_all_sorted(name, df, group_key='part', x_key='name', show_all_x_ticks=False):
    df.to_csv(name + '.csv', index=False, sep=',', float_format='%.4f')
    # fig, (ax_fmax, ax_luts, ax_fill) = plt.subplots(3, 1)
    fig, (ax_fmax, ax_fill) = plt.subplots(2, 1)

    for i, (group_name, group) in enumerate(df.groupby(group_key)):
        group_name = str(group_name)
        style = LINE_STYLES[i//LINE_COLORS]
        group.plot.line(x_key, 'fmax', ax=ax_fmax, label=group_name, style=style, linewidth=1)
        # group.plot.line(x_key, 'lut', ax=ax_luts, label=group_name, style=style)
        group.plot.line(x_key, 'utilisation', ax=ax_fill, label=group_name, style=style, linewidth=1)

    # for ax in (ax_fmax, ax_luts, ax_fill):
    for ax in (ax_fmax, ax_fill):
        ax.get_legend().remove()

        # ax.set_yscale('log')
        ax.yaxis.grid(True, which='major', linestyle='-')
        ax.yaxis.grid(True, which='minor', linestyle=':')

        ax.set_xlabel(x_key)
        # if show_all_x_ticks:
        #     ax.set_xticks(range(len(df['name'].unique())))
        #     ax.set_xticklabels(df['name'].unique())
        #     for tick in ax.get_xticklabels():
        #         tick.set_rotation(45)

    # make these tick labels invisible
    plt.setp(ax_fmax.get_xticklabels(), visible=False)
    ax_fmax.set_xlabel(x_key, visible=False)

    cols = math.ceil(len(df.groupby(group_key)) / 5)
    ax.legend(ncol=int(cols), framealpha=0.5, title=group_key, loc='lower right')

    ax_fmax.set_ylabel('F max')
    ax_fmax.yaxis.set_major_formatter(EngFormatter('MHz'))
    ax_fmax.yaxis.set_minor_formatter(EngFormatter('MHz'))

    # ax_luts.set_ylabel('LUT count')
    # ax_luts.yaxis.set_major_formatter(EngFormatter())

    ax_fill.set_ylabel('LUT Utilisation')
    ax_fill.yaxis.set_major_formatter(PercentFormatter())

    fig.set_size_inches(10, 6.5)

    plt.tight_layout()
    plt.margins(0.1, 0.1)
    plt.savefig(name + '.pdf')
    plt.show()


def graph_scatter(name, df, x, y, group_key):
    fig, ax = plt.subplots(1, 1)

    n_groups = len(df.groupby(group_key))

    cm = plt.get_cmap('gist_rainbow')
    colors = [cm(1. * i / n_groups) for i in range(n_groups)]

    for i, (group_name, group) in enumerate(df.groupby(group_key)):
        group.plot.line(x, y, ax=ax, label=group_name, color=colors[i], marker='.', linewidth=0.25, linestyle='--', markeredgewidth=.2, markeredgecolor='black')

    ax.yaxis.grid(True, which='major', linestyle='-')
    ax.yaxis.grid(True, which='minor', linestyle=':')

    ax.xaxis.grid(True, which='major', linestyle='-')
    ax.xaxis.grid(True, which='minor', linestyle=':')

    ax.set_ylabel('F max')
    ax.yaxis.set_major_formatter(EngFormatter('MHz'))
    ax.yaxis.set_minor_formatter(EngFormatter('MHz'))

    ax.set_xlabel('LUT Utilisation')
    ax.xaxis.set_major_formatter(PercentFormatter())

    cols = math.ceil(n_groups / 10)
    ax.legend(ncol=int(cols), framealpha=1.0, title=group_key, loc='lower left')

    fig.set_size_inches(10, 7)

    plt.tight_layout()
    plt.savefig(name + '.pdf')
    plt.show()


def main():
    json_data = read_json('results.json')
    json_data.sort(key=lambda x: alphanum_key(x['name']) + [x['vendor'], x['part']])
    df = accumulate_results(json_data)
    df = df.loc[df['lut'] != -1]

    # write_json('results.json', json_data)
    df.to_csv('results.csv', index=False, sep=',', float_format='%.4f')

    graph_all_sorted('iscas', df[df['name'].str.match(r'^s\d+[a-z]?$')], show_all_x_ticks=True)
    graph_fmax_sorted_by_part('add', df[df['name'].str.match(r'^add\d+$')])

    fir_regex = re.compile(r'^\d+xFIR_\d+xS832$')
    df = accumulate_results((x for x in json_data if fir_regex.match(x['name'])), generics=(('N_A', 'FIR instances'), ('N_B', 'Filler instances')))
    df = df.loc[df['lut'] != -1]
    df.to_csv('fir.csv', index=False, sep=',', float_format='%.4f')

    graph_all_sorted('fir_a', df, 'FIR instances', 'Filler instances')
    graph_all_sorted('fir_b', df, 'Filler instances', 'FIR instances')

    graph_scatter('fir', df, 'utilisation', 'fmax', 'FIR instances')


if __name__ == '__main__':
    main()
