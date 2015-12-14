# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
       
LabelType.create(id: 2, name: "Tube", pitch_length: "0430", print_width: "0300", print_length: "0400", feed_value: "08", fine_adjustment: "022")
LabelType.create(id: 3,name: "Rack",pitch_length: "0110",print_width: "0920",print_length: "0080",feed_value: "08",fine_adjustment: "004")

plate = LabelType.create(name: "Plate", pitch_length: "0110", print_width: "0920", print_length: "0080", feed_value: "08", fine_adjustment: "004")

header_text_1 = Bitmap.new(field_name: "header_text_1", x_origin: "0020", y_origin: "0035", horizontal_magnification: "1", vertical_magnification: "1", font: "G", space_adjustment: "00", rotational_angles: "00")
header_text_2 = Bitmap.new(field_name: "header_text_2", x_origin: "0020", y_origin: "0065", horizontal_magnification: "1", vertical_magnification: "1", font: "G", space_adjustment: "00", rotational_angles: "00")

location = Bitmap.new(field_name: "location", x_origin: "0030", y_origin: "0035", horizontal_magnification: "05", vertical_magnification: "1", font: "G", space_adjustment: "00", rotational_angles: "00")
parent_location = Bitmap.new(field_name: "parent_location", x_origin: "0030", y_origin: "0065", horizontal_magnification: "05", vertical_magnification: "1", font: "G", space_adjustment: "00", rotational_angles: "00")

barcode = Barcode.new(field_name: "barcode", x_origin: "0300", y_origin: "0000", barcode_type: "9", one_module_width: "02", height: "0070")

footer_text_1 = Bitmap.new(field_name: "footer_text_1", x_origin: "0050", y_origin: "0035", horizontal_magnification: "1", vertical_magnification: "1", font: "G", space_adjustment: "00", rotational_angles: "00")
footer_text_2 = Bitmap.new(field_name: "footer_text_2", x_origin: "0020", y_origin: "0065", horizontal_magnification: "1", vertical_magnification: "1", font: "G", space_adjustment: "00", rotational_angles: "00")

header = Header.create(bitmaps: [header_text_1, header_text_2])
label = Label.create(bitmaps: [location, parent_location], barcodes: [barcode])
footer = Footer.create(bitmaps: [ footer_text_1, footer_text_2])

LabelTemplate.create(name: "LabWhere", header: header, label: label, footer: footer, label_type: plate)
