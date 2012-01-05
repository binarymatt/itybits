<%inherit file="html5-base.mako" />
% for post in posts:
<article>
  <%include file="post.mako" args="post=post" />
    <div class='well'>
% if bf.config.blog.disqus.enabled:
<a href="${post.permalink}#disqus_thread" class='btn'>View Comments</a>
% endif
    </div>
</article>

% endfor
% if prev_link:
 <a href="${prev_link}">« Previous Page</a>
% endif
% if prev_link and next_link:
  --  
% endif
% if next_link:
 <a href="${next_link}">Next Page »</a>
% endif
