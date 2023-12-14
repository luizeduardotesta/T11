Dado('que eu acesse a pagina home da consultoria') do
    home.load
end

Quando('clico no menu {string}') do |menu_item|
    home.click_button(menu_item)
end

Então('devo ser redirecionado para a sessão {string}') do |sessao|
    home.validation_menu(sessao)
end