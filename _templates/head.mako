<title>${bf.config.blog.name}</title>
<link rel="alternate" type="application/rss+xml" title="RSS 2.0" href="${bf.util.site_path_helper(bf.config.blog.path,'/feed')}" />
<link rel="alternate" type="application/atom+xml" title="Atom 1.0"
href="${bf.util.site_path_helper(bf.config.blog.path,'/feed/atom')}" />
<link rel="stylesheet"
href="/fonts/stylesheet.css">
<link rel="stylesheet" href="/css/normalize.css?v=2">
<link rel="stylesheet" href="/css/website.css" type="text/css" media="screen" charset="utf-8">
% for css_file in bf.config.filters.syntax_highlight.mod.css_files_written:
<link rel='stylesheet' href='${css_file}' type='text/css' />
% endfor


<script src="/js/modernizr-1.6.min.js"></script>

