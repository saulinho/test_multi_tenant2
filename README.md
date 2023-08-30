# Readme

How to configure apllication to work with multi tenant (subdomain).

* Create new rails apllication

- rails new test_multi_tenant2 -j esbuild -c bootstrap -d postgresql
- Open file database.yml and configure postgres

* Install gem:

- open gemfile
- add gem 'acts_as_tenant'
- bundle

* Create models

- rails g scaffold Company name subdomain
- rails g scaffold Customer company:belongs_to name

* Alter models

- Open model customer and alter belongs_to to acts_as_tenant
- acts_as_tenant :company

* Application Controller

- Open application_controller.rb and add the code bellow
- set_current_tenant_by_subdomain(:company, :subdomain)

* Config

- Open application.rb in folder config and add the code bellow in class Application
- config.hosts = nil

* Don't allow open application without subdomain

- Open folder initializers and create file acts_as_tenant.rb
- Paste the code bellow

ActsAsTenant.configure do |config|
    config.require_tenant = true
end