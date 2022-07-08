module UsersHelper
    def users_type
        User.users_type.keys.map do |user_type|
            [User.user_type, user_type]
        end
    end

end
