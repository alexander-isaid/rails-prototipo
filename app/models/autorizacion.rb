class Autorizacion
    def purchase
        url = "https://api.rxedock.com/authorizations/purchase"

        data_transaction = JSON.dump({
            "account_id": "019418f4-843b-c498-a049-3198f9f7986c",
            "account_status": "ACTIVE",
            "person_id": "018809b0-16a3-4e0c-0a89-3201be876120",
            "product_id": "01942d15-6c1c-ae62-9f8a-0eaf78b49153",
            "product_status": "ACTIVE",
            "card_id": "01944c10-1d96-478f-5337-e0c881265460",
            "card_status": "NORMAL",
            "card_number": "5193XXXXXXXX3029",
            "card_expiration_date": "2510",
            "card_entry": {
              "code": "071",
              "mode": "PAN_AUTO_ENTRY_VIA_CONTACTLESS_M_CHIP",
              "pin": "TERMINAL_HAS_PIN_ENTRY_CAPABILITY"
            },
            "bank_account_number": "null",
            "bank_branch_number": "null",
            "transmission_date_time_gmt": "2023-08-04T16:32:56.000Z",
            "terminal_date": "0804",
            "terminal_time": "132653",
            "terminal_code": "10687774",
            "mti": "0100",
            "processing": {
              "type": "PURCHASE",
              "destiny_account_type": "NOT_SPECIFIED",
              "origin_account_type": "CREDIT_CARD_ACCOUNT",
              "code": "003000"
            },
            "transaction_type_indicator": "DEBIT",
            "nsu": "02269",
            "authorization_code": "791358",
            "transaction_origin": "VISA",
            "installment_type": "null",
            "installments": 1,
            "merchant_category_code": "5814",
            "establishment_code": "000000007677172",
            "establishment": "FILIAL TRATTORIA SAO PAULO BRA",
            "retrieval_reference_number": "050400000669",
            "pos_postal_code": "04538133",
            "acquirer_country_code": "076",
            "values": {
              "billing_conversion_rate": "3.553571",
              "billing_currency_code": "484",
              "billing_value": "1448.72",
              "settlement_currency_code": "840",
              "settlement_value": "85.26",
              "source_currency_code": "986",
              "source_value": "407.68",
              "credit_line_usage_fee": "null"
            },
            "preauthorization": "null",
            "token_data": "null",
            "funds_transfer": "null",
            "additional_amount": {
              "account_type": "20",
              "amount_type": "13",
              "currency_code": "986",
              "amount": "D2.56"
            },
            "transaction_indicators": {
              "card_present": true,
              "cardholder_present": true,
              "password_present": false,
              "cvv1_present": false,
              "cvv2_present": false,
              "cvv3_present": true,
              "token_present": false,
              "is_3ds_present": false,
              "is_3ds_valid": false,
              "recurring": false,
              "allows_partial_approval": false,
              "pin_validated_offline": false,
              "partially_reversed": false,
              "preauthorization": false,
              "is_crossborder": false,
              "is_dcc": false,
              "only_supports_purchase": false,
              "is_international": true,
              "is_funds_transfer": false,
              "is_automated_fuel_dispenser": false,
              "is_ecommerce": false
            },
            "exchange_rate": {
              "dest_asset_code": "320",
              "date_time_gmt": "2024-10-02T18:35:52.000Z",
              "final_billing_value": "25.00"
            },
            "external_account_id": "4568270701552841"
          })

        process_transaction(url, data_transaction)

    end
    
    def reversal
        process_transaction('reversal')
    end
    
    def withdrawal
        url = "https://api.rxedock.com/authorizations/withdrawal"
        data_transaction = JSON.dump({
            "account_id": "4568270701552841",
            "transmission_date_time_gmt": "2024-10-02T18:38:07.000Z",
            "mti": "0100",
            "transaction_type_indicator": "DEBIT",
            "nsu": "724331",
            "card_expiration_date": "2909",
            "transaction_origin": "VISA",
            "card_entry": {
                "code": "0510",
                "pin": "TERMINAL_HAS_PIN_ENTRY_CAPABILITY",
                "mode": "PAN_AUTO_ENTRY_VIA_CHIP"
            },
            "merchant_category_code": "6011",
            "values": {
                "source_currency_code": "320",
                "billing_currency_code": "320",
                "source_value": "15.00",
                "billing_value": "15.00",
                "billing_conversion_rate": "1",
                "credit_line_usage_fee": "17.4000"
            },
            "establishment": "ACQUIRER NAME            CITY NAME    MX",
            "terminal_code": "ATM01   ",
            "establishment_code": "CARD ACCEPTOR  ",
            "acquirer_country_code": "320",
            "token_data": {},
            "transaction_indicators": {
                "card_present": true,
                "cardholder_present": false,
                "password_present": true,
                "cvv1_present": false,
                "cvv2_present": false,
                "cvv3_present": true,
                "token_present": false,
                "is_3ds_present": false,
                "is_3ds_valid": false,
                "recurring": false,
                "allows_partial_approval": false,
                "pin_validated_offline": false,
                "partially_reversed": false,
                "preauthorization": false,
                "is_crossborder": false,
                "is_dcc": false,
                "only_supports_purchase": true,
                "is_international": false,
                "is_automated_fuel_dispenser": false,
                "is_ecommerce": false
            },
            "retrieval_reference_number": "413018724331",
            "product_id": "0190bc2d-e089-271c-a5af-8b692d2b6909",
            "product_status": "BLOCKED",
            "person_id": "0192200b-e03f-0917-ebbc-55cfdfab3a64",
            "card_id": "0191e227-28f9-1bdd-33e0-e83df81984c5",
            "card_status": "NORMAL",
            "account_status": "ACTIVE",
            "card_number": "4915XXXXXXXX8817",
            "processing": {
                "type": "WITHDRAWAL",
                "origin_account_type": "CHECKING_ACCOUNT",
                "destiny_account_type": "NOT_SPECIFIED",
                "code": "012000"
            },
            "exchange_rate": {
                "dest_asset_code": "320",
                "date_time_gmt": "2024-10-02T18:38:07.000Z",
                "final_billing_value": "15.00"
            },
            "external_account_id": "4568270701552841"
            })
        process_transaction(url,data_transaction)
    end
    
    def deposit
        process_transaction('deposit')
    end
    
    def payment
        process_transaction('payment')
    end
    
    def transfer
        process_transaction('transfer')
    end
      
    private
      
        def process_transaction(url, body)

            url = URI(url)

            http = Net::HTTP.new(url.host, url.port);
            request = Net::HTTP::Post.new(url)
            request["Content-Type"] = "application/json"
            request.body = body.to_json
            response = http.request(request)
            puts response.read_body
            success = response.read_body
            if success
                reference = SecureRandom.hex(8)
                transaction.update(status: 'completed', reference: reference)
                
                render json: {
                success: true,
                transaction_id: transaction.id,
                reference: reference,
                message: "#{type.capitalize} procesado correctamente",
                amount: transaction.amount
                }
            else
                error_message = ["Conexión perdida", "Tiempo de espera agotado", "Error en el servidor"].sample
                transaction.update(status: 'failed', message: error_message)
                
                render json: {
                success: false,
                transaction_id: transaction.id,
                message: error_message
                }, status: :internal_server_error
            end
            
        end
end