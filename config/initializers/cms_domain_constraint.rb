class CmsDomainConstraint
  def initialize(*domains)
    @domains = [domains].flatten
  end

  def matches?(request)
    @domains.include?(request.domain)
  end
end

# Domains other than "other.dev" and "local.dev" will not be rendered in the CMS
unless defined?(DomainConstraint)
  DomainConstraint = CmsDomainConstraint.new('other.dev', 'local.dev')
end
