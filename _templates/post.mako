<%page args="post"/>
    <a name="${post.slug}"></a>
    <div class='page-header'>
  <h2 class="blog_post_title"><a href="${post.permapath()}" rel="bookmark" title="Permanent Link to ${post.title}">${post.title}</a> <small>${post.date.strftime("%B %d, %Y at %I:%M %p")}  
<% 
   category_links = []
   for category in post.categories:
       if post.draft:
           #For drafts, we don't write to the category dirs, so just write the categories as text
           category_links.append(category.name)
       else:
           category_links.append("<span class='label success'><a href='%s'>%s</a></span>" % (category.path, category.name))
%>
${"&nbsp;".join(category_links)}

</small></h2>
    </div>
    <div class='post-content'>
${self.post_prose(post)}
    </div>



<%def name="post_prose(post)">
  ${post.content}
</%def>
