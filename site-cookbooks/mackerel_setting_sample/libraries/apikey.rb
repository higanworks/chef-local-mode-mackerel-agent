module APIHelper
  require 'chef/knife/core/ui'
  def self.collect_api_key
    return ENV['MACKEREL_API_KEY'] if ENV['MACKEREL_API_KEY']
    ask_from_stdin
  end

  def self.ask_from_stdin
    require 'chef/knife/core/ui'
    begin
      timeout(10) {
        ui = Chef::Knife::UI.new($stdout, $sterr, $stdin, {})
        ui.msg("========================================")
        ui.ask("Please input Mackrel API_KEY ? ")
      }
    rescue Timeout::Error
      Chef::Log.error "Could not get Mackerel API KEY."
      'Your API KEY'
    end
  end
end
