include Chef::Mixin::RecipeDefinitionDSLCore

actions :create, :attach, :detach, :snapshot, :prune

attribute :aws_access_key,        :kind_of => String
attribute :aws_secret_access_key, :kind_of => String
attribute :size,                  :kind_of => Integer
attribute :snapshot_id,           :kind_of => String
attribute :availability_zone,     :kind_of => String
attribute :device,                :kind_of => String
attribute :volume_id,             :kind_of => String
attribute :description,           :kind_of => String
attribute :timeout,               :default => 3*60 # 3 mins, nil or 0 for no timeout
attribute :snapshots_to_keep,     :default => 2
attribute :create_if_missing,     :default => false

def initialize(*args)
  super
  @action = :create
end

def update_volume(volid)
  set_or_return(:volume_id,  volid, :kind_of=>String)
end
