module ApplicationHelper
  def bootstrap_paginate(collection, options = {})
    will_paginate(collection, options.merge(renderer: BootstrapLinkRenderer))
  end
end
