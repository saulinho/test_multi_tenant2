# Readme

How to configure apllication to work with multi tenant (subdomain).

1. Create new rails apllication

- rails new test_multi_tenant2 -j esbuild -c bootstrap -d postgresql
- Open file database.yml and configure postgres

2. Install gem:

- open gemfile
- add gem 'acts_as_tenant'
- bundle

3. Create models

'rails g scaffold Company name subdomain'
'rails g scaffold Customer company:belongs_to name'

4. Alter models

- Open model customer and alter belongs_to to acts_as_tenant
'acts_as_tenant :company'

5. Application Controller

- Open application_controller.rb and add the code bellow
'set_current_tenant_by_subdomain(:company, :subdomain)'

6. Config

- Open application.rb in folder config and add the code bellow in class Application
'config.hosts = nil'

7. Don't allow open application without subdomain

- Open folder initializers and create file acts_as_tenant.rb
- Paste the code bellow

`ActsAsTenant.configure do |config|
    config.require_tenant = true
end`