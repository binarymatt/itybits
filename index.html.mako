<%inherit file="_templates/html5-base.mako" />
<h2>Blog Posts:</h2>
<ul class='blog_list'>
% for post in bf.config.blog.posts:
    <li>
        <span>${post.date.strftime('%B %d, %Y')}</span>
        <a href="${post.path}">${post.title}</a>
    </li>
% endfor
</ul>
