module NpmRailtie
    class Railtie < Rails::Railtie
        railtie_name :npm
        config.before_initialize do |app|
            ["lib", "vendor"].each do |dir|
                app.config.assets.paths << Rails.root.join(dir, 'assets', 'node_modules')
            end
        end
    end
end