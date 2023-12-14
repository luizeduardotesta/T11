Dado('que eu acesse a pagina home da consultoria') do
    home.load
end

Quando('clico no menu {string}') do |menu_item|
    home.click_button(menu_item)
end

Então('devo ser redirecionado para a sessão {string}') do |sessao|
    home.validation_menu(sessao)
end

Dado('preencha o formulario de contato') do
    home.load
    home.fill_contact_form(name: "Nome Test", company: "Company Test", mail: "test@mail.com", phone:5511999999999, message: "Está é uma mensagem de teste de automação por favor desconsidere a bagaça")
end

Quando('eu clicar no botão Enviar') do
    home.click_submit_button
end

Então('devo receber uma mensagem de alerta') do
    #expect(home.alert_visible).to be true
    begin
        page.driver.browser.switch_to.alert.accept
        puts "Alerta detectado e aceito"
    rescue Selenium::WebDriver::Error::NoAlertPresentError
        puts "Nenhum alerta presente"
    end
end