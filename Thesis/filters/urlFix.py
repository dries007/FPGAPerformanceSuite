#!/usr/bin/env python
"""
Panflute filter that makes "bare" links pettier
"""
from string import Template  # using .format() is hard because of {} in tex
import panflute as pf

TEMPLATE_HREF = Template(r'\href{$url}{$text}')


def action(e: pf.Element, doc: pf.Doc):
    if isinstance(e, pf.Link) and 'uri' in e.classes and len(e.content) == 1:
        content = e.content[0]
        if isinstance(content, pf.Str) and content.text == e.url:
            text = None
            if content.text.startswith('http://'):
                text = content.text[7:]
            if content.text.startswith('https://'):
                text = content.text[8:]
            if text:
                text = pf.convert_text('`%s`' % text, output_format='latex')
            return pf.RawInline(TEMPLATE_HREF.safe_substitute(url=e.url, text=text), format='latex')


def main(doc=None):
    return pf.run_filter(action, doc=doc)


if __name__ == '__main__':
    main()
