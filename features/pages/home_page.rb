class Home < SitePrism::Page
    include RSpec::Matchers
    include Capybara::DSL

    set_url '/'

    #MENU
    element :menu_item_sobre, :xpath, '//p[text()="Sobre"]'
    element :menu_item_servicos, :xpath, '//p[@class="sc-laEPQd enhNFi" and text()="Serviços"]'

    #VALIDATION
    element :titulo_sobre_nos, :xpath, '//p[text()="Sobre nós"]'
    element :titulo_servicos, :xpath, '//p[@class="sc-kbUMEY llGxuN" and text()="Serviços"]'


    def click_button(menu_item)

        case menu_item
        when "Sobre"
            menu_item_sobre.click
        when "Serviços"
            menu_item_servicos.click
        else
            raise "Elemento não encontrado: #{menu_item}."
        end
    end

    def validation_menu(sessao)
        case sessao
        when "Sobre nós"
            expect(titulo_sobre_nos).to have_text(sessao)
        when "Serviços"
            expect(titulo_servicos).to have_text(sessao)

        else
            raise "Elemento não encontrado: #{menu_item}."
        end
    end
end