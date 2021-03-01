require 'pdf_forms'

class FillFormsController < ActionController::API
  def fill
    new_form_name = "tmp/dental_admission_filled_#{SecureRandom.hex}.pdf"

    pdftk = PdfForms.new('/usr/local/bin/pdftk')
    pdftk.get_field_names 'test/fixtures/files/dental_admission.pdf'
    pdftk.fill_form 'test/fixtures/files/dental_admission.pdf', new_form_name, params, flatten: true

    pdf = File.read(new_form_name)
    send_data pdf, filename: 'dental_admission_filled.pdf', type: 'application/pdf'
  end
end
