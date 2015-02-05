module DispatchHelper
end

module CloudToolkit

  STATUS_OCCUPIED = 0
  STATUS_AVAILABLE = 1
  STATUS_ONPROCESS = 2

  # Do nothing but add class variable @tenant_name
  def initialize
    @tenant_name = ''
  end

  # Set tenant_name.
  def set_tenant_name(tenant_name)
    @tenant_name = ''
  end

  # Authentification
  # Require token if no valid token
  def self.require_token(tenant_name)
  end

  # List info for all machines
  def self.list_machines
    CloudToolkit.require_token @tenant_name
    return ["Test Machine"]
  end

  # Generate a new machine and return machine config info
  # The config info should include "ip_address", "specifier"
  def create_machine(setting)
    CloudToolkit.require_token @tenant_name
  end

  # Stop a machine
  def stop_machine
    CloudToolkit.require_token @tenant_name
  end

  # Delete a machine
  def delete_machine
    CloudToolkit.require_token @tenant_name
  end

  # Get machine status
  def machine_status (specifier)
    CloudToolkit.require_token @tenant_name
    return {:name => "Test Machine"}
  end
end
