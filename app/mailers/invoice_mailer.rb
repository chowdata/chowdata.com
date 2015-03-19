class InvoiceMailer < ApplicationMailer

  def forward_invoice(email)
    mail :subject => "Forwarded invoice from #{email}",
         :to      => "anthony@chowdata.com",
         :from    => email
  end

end
