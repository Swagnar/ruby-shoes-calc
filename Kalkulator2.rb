Shoes.app(title: "Kalkulator", width: 400, height: 400) {
	
	@tmp = "0"
	@operacja = 0

	def buttonClick(liczba)
		if @numbers.text == "0"
			@numbers.replace liczba
		else
			@numbers.text = @numbers.text + liczba
		end
	end

	def operandClick(schowek)
		if @numbers.text == "0"
			alert "Brak liczb"
		else 
			schowek = @numbers.text
			#@tmp_show.replace schowek + "	"
			@numbers.replace "0"
			return schowek
		end
	end

	def silnia(n)
 		if n < 0
  			return nil
 		end
 		if n == 0
		  return 1
		end 
		result = 1
 		while n > 0
  			result = result * n  
  			n -= 1
 		end 
 		return result.to_s
	end

	def square_root(num)
		if num <= 0
			alert "nie mozna pierwiastkowac gdy <= 0"
		else
			start = num.to_s(2); start = start[0,(start.length/2)].to_i(2)
  			retval = start
  			for i in 0..10000 do
    			retval = ((retval + num/retval)/2).to_f
    			return retval if retval*retval == num
  			end
  			retval
  		end
	end



	stack {
		flow {
			#@tmp_show = para "0"
			@numbers = para "22"
		}
		flow {

			@clear = button "C"
			@clear.click {
				@numbers.replace "0"
			}

			@modulate = button "+/-", :width => 40
			@modulate.click {
				if @numbers.text.to_i > 0
					@numbers.replace @numbers.text.insert(0, "-")
				elsif @numbers.text == "0"
				else
					@abso = @numbers.text.to_i
					@abso = @abso.abs
					@numbers.replace @abso.to_s
				end
			}

			@dot = button "."
			@dot.click {
				if @numbers.text.include? "."
					alert("Liczba posiada juz float'a")
				else
					@numbers.text = @numbers.text + "."
				end
			}

			@div = button "/"
			@div.click {
				if @numbers.text == "0"
					alert "nie mozna dzielic przez 0"
				else
					@tmp = operandClick(@tmp)
					@operacja = 1
				end
			}
		}
		flow {

			@sev = button "7"
			@sev.click {
				buttonClick("7")
			}

			@eig = button "8"
			@eig.click {
				buttonClick("8")
			}

			@nin = button "9"
			@nin.click {
				buttonClick("9")
			}
			@mul = button "*"
			@mul.click {
				@tmp = operandClick(@tmp)
				@operacja = 2
			}
		}
		flow {
			@fou = button "4"
			@fou.click {
				buttonClick("4")
			}
			@fiv = button "5"
			@fiv.click {
				buttonClick("5")
			}
			@six = button "6"
			@six.click {
				buttonClick("6")
			}

			@add = button "+"
			@add.click {
				@tmp = operandClick(@tmp)
				@operacja = 3
			}
		}
		flow {
			@one = button "1"
			@one.click {
				buttonClick("1")
			}

			@two = button "2"
			@two.click {
				buttonClick("2")
			}
			@thr = button "3"
			@thr.click {
				buttonClick("3")
			}
			@sub = button "-"
			@sub.click {
				@tmp = operandClick{@tmp}
				@operacja = 4
			}
		}
		flow {
			@sqr = button "\u221A", :width => 40
			@sqr.click {
				@numbers.replace square_root(@numbers.text.to_i)
				@operacja = 5
			}
			@cero = button "0"
			@do = button "="
			@do.click {
				if @operacja == 1
					if @numbers.text == "0"
						alert "Cannot divide by 0"
					else
						@numbers.replace @tmp.to_f / @numbers.text.to_f
					end
				elsif @operacja == 2
					@numbers.replace @tmp.to_f * @numbers.text.to_f
				elsif @operacja == 3
					@numbers.replace @tmp.to_f + @numbers.text.to_f
				elsif @operacja == 4
					@numbers.replace @tmp.to_f - @numbers.text.to_f
				elsif @operacja == 5
					alert "pierwiastkowanie odbywa sie za pomoca operanda haha 420"
				elsif @operacja == 6
					@numbers.replace @tmp.to_f ** @numbers.text.to_f
				end
			}
			@power = button "**", :width => 40
			@power.click {
				@tmp = operandClick(@tmp)
				@operacja = 6
			}

			@factorial = button "!"
			@factorial.click {
				@numbers.replace silnia(@numbers.text.to_i)
			}
		}
	}
}