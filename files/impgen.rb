module PE
  def pe_get16(offset)
    seek(offset, File::SEEK_SET)
    read(2).unpack("v").first
  end

  def pe_get32(offset)
    seek(offset, File::SEEK_SET)
    read(4).unpack("V").first
  end

end

def main
  dll = open(ARGV[0], "rb")
  dll.extend PE

  pe_header_offset = dll.pe_get32(0x3c)
  opthdr_ofs = pe_header_offset + 4 + 20
  num_entries = dll.pe_get32(opthdr_ofs + 92)

  if num_entries < 1 #no exports
    exit 1
  end

  export_rva = dll.pe_get32(opthdr_ofs + 96)
  export_size = dll.pe_get32(opthdr_ofs + 100)
  nsections = dll.pe_get16(pe_header_offset + 4 +2)
  secptr = (pe_header_offset + 4 + 20 +
	    dll.pe_get16(pe_header_offset + 4 + 16))

  expptr = 0
  nsections.times do |i|
    secptr1 = secptr + 40 * i
    vaddr = dll.pe_get32(secptr1 + 12)
    vsize = dll.pe_get32(secptr1 + 16)
    fptr = dll.pe_get32(secptr1 + 20)
    if vaddr <= export_rva && vaddr + vsize > export_rva
      expptr = fptr + export_rva - vaddr
      if export_rva + export_size > vaddr + vsize
	export_size = vsize - export_rva - vaddr
	break
      end
    end
  end

  dll.seek(expptr, File::SEEK_SET)
  expdata = dll.read(export_size)

  nexp = expdata[24, 4].unpack("V").first
  name_rvas = expdata[32, 4].unpack("V").first

  print "EXPORTS\n"
  name_rva = expdata[name_rvas - export_rva, 4].unpack("V").first
  print expdata[(name_rva - export_rva)..-1].tr("\0", "\n")
end

main
