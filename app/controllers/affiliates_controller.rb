class AffiliatesController < Spree::BaseController
  resource_controller :only => [:show, :index]

end
