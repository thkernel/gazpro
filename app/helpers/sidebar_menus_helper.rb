module SidebarMenusHelper

    def sidebar_menu 
        if current_account.role.name == "Superuser"
            render "layouts/partials/dashboard/navs/superuser-nav"
        elsif current_account.role.name == "Administrateur"
            render "layouts/partials/dashboard/navs/admin-nav"
        elsif current_account.role.name == "Agent"
            render "layouts/partials/dashboard/navs/agent-nav"
        elsif current_account.role.name == "Gérant"
            render "layouts/partials/dashboard/navs/gerant-nav"

        elsif current_account.role.name == "Caissier"
            render "layouts/partials/dashboard/navs/caissier-nav"
        

        end

    end

end