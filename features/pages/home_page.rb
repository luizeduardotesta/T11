class Home < SitePrism::Page
    include RSpec::Matchers
    include Capybara::DSL

    set_url '/'

    #MENU
    element :menu_item_sobre, :xpath, '//p[text()="Sobre"]'
    element :menu_item_servicos, :xpath, '//p[@class="sc-laEPQd enhNFi" and text()="Serviços"]'
    element :menu_item_conexoes, :xpath, '//p[@class="sc-laEPQd enhNFi" and text()="Conexões"]' 
    element :menu_item_reconhecimento, :xpath, '//p[@class="sc-laEPQd enhNFi" and text()="Reconhecimento"]' 
    element :menu_item_fale_conosco, :xpath, '//p[@class="sc-laEPQd bMlkUB" and text()="Fale conosco"]' 

    #VALIDATION
    element :titulo_sobre_nos, :xpath, '//p[text()="Sobre nós"]'
    element :titulo_servicos, :xpath, '//p[@class="sc-kbUMEY llGxuN"]'
    element :titulo_conexoes, :xpath, '//p[@class="sc-imALrc jvqV"]'
    element :titulo_reconhecimento, :xpath, '//p[@class="sc-aklqw cnwTaR"]'
    element :titulo_fale_conosco, :xpath, '//h2[@class="sc-b7704fd6-6 gtBdTn"]'

    #FORM
    element :input_name, :xpath, '//input[@name="fullName"]'
    element :input_company, :xpath, '//input[@name="companyName"]'
    element :input_mail, :xpath, '//input[@name="mail"]'
    element :input_phone, :xpath, '//input[@name="telephone"]'
    element :input_message, :xpath, '//textarea[@id="message"]'
    element :submit_button, :xpath, '//button[@type="submit"]'
    element :alert_message, :xpath, '//div[@role="alert"]'



    def click_button(menu_item)

        case menu_item
        when "Sobre"
            menu_item_sobre.click
        when "Serviços"
            menu_item_servicos.click
        when "Conexões"
            menu_item_conexoes.click
        when "Reconhecimento"
            menu_item_reconhecimento.click
        when "Fale Conosco"
            menu_item_fale_conosco.click
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
        when "Conexões"
            expect(titulo_conexoes).to have_text(sessao)
        when "Reconhecimento"
            expect(titulo_reconhecimento).to have_text(sessao)
        when "Fale Conosco"
            expect(titulo_fale_conosco).to have_text(sessao)
        else
            raise "Elemento não encontrado: #{menu_item}."
        end
    end

    def fill_contact_form(name:, company:, mail:, phone:, message:)
        input_name.set(name)
        input_company.set(company)
        input_mail.set(mail)
        input_phone.set(phone)
        input_message.set(message)
    end

    def click_submit_button
        submit_button.click
    end

    def alert_visible
        alert_message.visible?
    end

end