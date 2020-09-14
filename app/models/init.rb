class Init < ApplicationRecord
    require 'json'
    require 'net/http'
    has_one :customer

    def initial
        puts "imprime"
        puts @init
        @parsed = JSON.parse(self.entrada)
        @customer = Customer.find_or_create_by(externalCore: @parsed['buyer']['id'])
        @order = Order.find_or_create_by(externalCode: @parsed['id'])  
        puts @order
        self.parsing    
        self.processor_data
        self.send_request
    end

    #salva dados do cliente       
    def save_customer_data
        @customer.init_id = self.id
        @customer.externalCore = @parsed['buyer']['id']
        @customer.name = @parsed['buyer']['nickname']
        @customer.email = @parsed['buyer']['email']
        @customer.contact = @parsed['buyer']['phone']['area_code'] 
        @customer.contact.concat(@parsed['buyer']['phone']['number'])
        @customer.save
    end       

    #salva dados do pedido
    def save_order_data        
        @order.customer_id = customer.id 
        @order.externalCode = @parsed['id']
        @order.storeId = @parsed['store_id']
        @order.subTotal = @parsed['total_amount']
        @order.deliveryFee = @parsed['total_shipping']
        @order.total_shipping = @parsed['total_shipping']
        @order.total = @parsed['total_amount_with_shipping']
        @order.country = @parsed['shipping']['receiver_address']['country']['id']
        @order.state = @parsed['shipping']['receiver_address']['state']['name']
        @order.city = @parsed['shipping']['receiver_address']['city']['name']
        @order.district = @parsed['shipping']['receiver_address']['neighborhood']['name']
        @order.street = @parsed['shipping']['receiver_address']['street_name']
        @order.complement = @parsed['shipping']['receiver_address']['comment']
        @order.latitude =  @parsed['shipping']['receiver_address']['latitude']
        @order.longitude =  @parsed['shipping']['receiver_address']['longitude']
        @order.dtOrderCreate = @parsed['date_created']
        @order.postalCode = @parsed['shipping']['receiver_address']['zip_code']
        @order.number = @parsed['shipping']['receiver_address']['street_number']
        @order.save
    end

    #salva dados do item
    def save_items_data
        @parsed["order_items"].each do |i| 
            externalCode = i['item']['id']
            item = Item.find_or_create_by(externalCode: externalCode)
            item.order_id = @order.id
            item.externalCode = i['item']['id']
            item.name = i['item']['title']
            item.price = i['unit_price']
            item.quantity = i['quantity']
            item.total = i['full_unit_price']
            @subItems = []
            item.save
        end
    end
    
    #salva dados do pagamento
    def save_payments_data
        @parsed["payments"].each do |i|
            pag = Payment.find_or_create_by(typ: i['payment_type'])
            pag.order_id = @order.id 
            pag.typ = i['payment_type']
            pag.value = i['installment_amount']
            pag.save
        end
    end

    def parsing
        #faz o parsing do json recebido de entrada
        self.save_customer_data
        self.save_order_data
        self.save_items_data
        self.save_payments_data
    end

    #processamendo dos dados recebidos
    def processor_data
        #monta o request com dados do cliente
        c ={}
        c["externalCode"] = @customer.externalCore
        c["externalCode"] = @customer.externalCore
        c["name"] = @customer.name
        c["email"] = @customer.email
        c["contact"] = @customer.contact

        #monta request com dados dos itens
        i = []
        @order.items.each do |item|
            aux_item = {}
            aux_item["externalCode"] = item.externalCode
            aux_item["name"] =  item.name 
            aux_item["price"] = item.price
            aux_item["quantity"] = item.quantity
            aux_item["total"] = item.total 
            aux_item["subItems"] = @subItems
            i << aux_item
        end
        
        #monta request com dados dos pagamentos
        p = []
        @order.payments.each do |pag|
            aux_pag = {}
            aux_pag["type"] =  pag.typ
            aux_pag["value"] = pag.value
            p << aux_pag
        end

        #monta o request para envio à API
        @request_body ={}
        @request_body["externalCode"] = @order.externalCode
        @request_body["storeId"] = @order.storeId
        @request_body["subTotal"] = @order.subTotal
        @request_body["deliveryFee"] = @order.deliveryFee
        @request_body["total_shipping"] = @order.total_shipping
        @request_body["total"] = @order.total
        @request_body["country"] = @order.country
        @request_body["state"] = @order.state
        @request_body["city"] = @order.city
        @request_body["district"] = @order.district
        @request_body["street"] = @order.street
        @request_body["complement"] = @order.complement
        @request_body["latitude"] = @order.latitude
        @request_body["longitude"] = @order.longitude
        @request_body["dtOrderCreate"] = @order.dtOrderCreate
        @request_body["postalCode"] = @order.postalCode
        @request_body["number"] = @order.number
        @request_body["customer"] = c
        @request_body["items"] = i
        @request_body["payments"] = p

        #salva o json a ser enviado para mostrar na tela
        self.processamento = @request_body.to_json 
    end

    #envia request para a API
    def send_request

        uri = URI("https://delivery-center-recruitment-ap.herokuapp.com/")

        # Cria os parâmetros http
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true

        request = Net::HTTP::Post.new("https://delivery-center-recruitment-ap.herokuapp.com/", {'Content-Type' => 'application/json'})
        request.body = @request_body.to_json
        response = http.request(request)

        #salva resposta para mostrar na tela
        self.resposta = response.body
        self.save
    end
end


