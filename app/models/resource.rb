# 权限管理中的资源声明
#class Resource
#  include Resourcing
#  group :project do
#    resource [ :create, :update, :destroy, :set_access, :read ], Project
#  end
#
#  group :user do
#    resource [:set_access], User
#  end
#
#  group :team do
#    resource [:read], Team
#  end
#end
