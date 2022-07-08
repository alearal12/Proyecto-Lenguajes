class User < ApplicationRecord

   enum user_type: { administrator: 0, kitchen_user: 1} 
end
