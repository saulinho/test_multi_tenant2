class Customer < ApplicationRecord
  acts_as_tenant :company
end
