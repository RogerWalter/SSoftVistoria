class Planilha{
  var _credentials = r'''
{
  "type": "service_account",
  "project_id": "ssoft-vistoria",
  "private_key_id": "beed357b172091d3fcb0abdddea9818497805ca5",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDOpG/9OCulit+Z\n1bKvCkfiBlE9tD06ddhiIb/D5QGiQPFQRDW13mcFXki1JtkbXQwE3yw1n248SId0\nrKm2iY/DqPHDZXjZ5DVNyN2XZtEgEWVNVwXXFUeHj61ZsNawE1uZ+rm71ujFBTnM\nEk3BzURvLvy6EbXQ1Nk3BZgCe7fsaZGH2hnLlvphoYV0WEENV24PjPx69z5rErDV\ntSqDRykuw8sxOad2Jew915jAw8h4/IVJ25inSJZVScYgO/Z9uvtsUK/aeoP0n6Nv\nrkDfbY5Ic0qqWwpitrnaRF0l2HSvivp0f6MF5eo6MUbTXdlnPVXajXu6XFrf4DWL\nb76cXmFLAgMBAAECggEAGMYMCw6d5PXWQsok5ulTntxlBwHByW1xaKplJCYjYQFq\nLNZQniIwtasNCnLC2o34L+lVkoQvohiL7Mf6fMDXNHzfpy5WI8FBRrcLIeiYr8CG\nJZSGRbfuYGkwPi1+P5PCip5NgCCOvXgX6shS/CYQy0eV0vTmmEe8VuVbyQhuD3CN\ndL/nugAGqdkE/phPoll0Kt40z/rn/6U2ApaQbnB9BBSk7x2mqopLMKH9yN+7JQrT\nK6FigE3aIRYGcCXoCOSUn0YyrSSIKhpea0uNA1OfI81dN7ud4zPE2C46xagzrk7w\nXtvKNz95z5nPvhrIgVNukEmTc6nSMPzJxpGKEjLuAQKBgQDnAOHchBevVM4MMwbC\nYWNaT6BkbSYICAXVuaevF+KWPXtvfJ750DWn5C8TBXdf8SbQlkEtotdQt3m4lp4Y\nML1NWKIYPozxSsfK5+zWTmkHLvqSXjS/bnIS50JYQfepQlRv744+8YpfRepiQiCo\nfCIlZYjI+oTPdjvLGMHYZIxbAQKBgQDlALfn+0uH2l3CL+jM0LxxL4G76890JStd\nQBHx/J2DYdVXgpqOGilLhVAUgxwOL9z/VUJPl9Vy4Bzl0F/bqwlLjWpuckfp9rAL\nshTAhdqUN2X8ACPk4R7z6Rm1Qy64gx7t5vpp8XB1coNzzWbPwQtbmvjpcowvqrXB\n4zVr2Ne4SwKBgBLBXpUx4F5q60PQTMcxcwidGG+u8PyL8jVVGok7zjjWixQVMS8l\nOYYFH9FSi0ut37Hl0SrsYsD59JcJG5LpOiVygc6oHXdl0+zkgbUwrpRXux5xKaU1\nSWvBfQB/cqU6bnKcJ5dyswJjQdFyfwZO9dLFeKKgvHG/rsEhpHN2TnMBAoGBAIiC\njB6Ki3TZdAic/J6TU7H5CtIV+N2YhqgY2FmzJ8Y43K9E2JMa/0DYoGsJ2QCQAaJn\nlZbSwNewxykrtOjCpVDXZPmfwES03C6song9kpXGDFJTVxJKLGRjsQJ/oOs2popU\npTPgTBSHBdtTNxVjUzzxPa4TrYOAtMZ2hdLbOYTPAoGBAJKCljRg09YdQE0mXFCg\n205Cijy97saWo7X2V1vo56tjz4RgYpi8Vi0XBq3o2E0KadsAv2gvFL9IrZp2wKq+\ngwghFEfwwXEQYnt/NhPCOz1an45XCvMExs57J2Rw9wl+b6y/64aa5crI6wTxQDBU\ni29eATJE0TBoL+4aQMe0UjoN\n-----END PRIVATE KEY-----\n",
  "client_email": "vistoria-teccel@ssoft-vistoria.iam.gserviceaccount.com",
  "client_id": "109834947007312273222",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/vistoria-teccel%40ssoft-vistoria.iam.gserviceaccount.com"
}
''';
  var _spreadsheetId = '1ASS0HlURYu4DXMsaheTdGGhJusTrR5JmQ5ADcpr31gM';

  Planilha();

  get credentials => _credentials;

  set credentials(value) {
    _credentials = value;
  }

  get spreadsheetId => _spreadsheetId;

  set spreadsheetId(value) {
    _spreadsheetId = value;
  }
}