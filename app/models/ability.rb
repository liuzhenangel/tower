class Ability
  include CanCan::Ability

  # add by easonhan for debug purpose
  attr_reader :user

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)
    @user = user # add by easonhan for debug purpose

    if user.has_role?('admin')
      can :manage, :all
    end

    Access.all_without_reserved.each do |role|
      next unless user.has_role?(role.name)
      role.role_resources.each do |role_resource|
        resource = Resource.find_by_name(role_resource.resource_name)
        if resource[:behavior]
          block = resource[:behavior]
          can resource[:verb], resource[:object] do |object|
            block.call(user, object)
          end
        else
          can resource[:verb], resource[:object]
        end
      end
    end
  end
end
