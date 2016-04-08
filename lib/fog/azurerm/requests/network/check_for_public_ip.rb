module Fog
  module Network
    class AzureRM
      # Mock class for Network Request
      class Real
        def check_for_public_ip(resource_group, name)
          begin
            promise = @network_client.public_ipaddresses.get(resource_group, name)
            promise.value!
            return true
          rescue MsRestAzure::AzureOperationError => e
            puts "Azure::PublicIp - Exception is: #{e.body}"
            return false if e.body.error['code'] == 'ResourceNotFound'
            return true
          end
        end
      end

      # Mock class for Network Request
      class Mock
        def check_for_public_ip(_resource_group, _name)
        end
      end
    end
  end
end
