class User < ApplicationRecord
   has_secure_password
   enum user_type: { administrator: 0, kitchen_user: 1} 
end
