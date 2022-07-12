module UsersHelper
    def user_types
        User.user_types.keys.map do |user_type|
            [User.user_types, user_type]
        end
    end

end
