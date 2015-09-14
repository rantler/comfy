module ApplicationHelper

  def cms_header
    cms_snippet_render(:header, cms_site)
  end

  def cms_footer
    cms_snippet_render(:footer, cms_site)
  end

  def cms_site
    # Comfy::Cms::Site.find_by_hostname("#{CurrentDomainMiddleware.current_domain}:3000")
    Comfy::Cms::Site.find(1)
  end

end
