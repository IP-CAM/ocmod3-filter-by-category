#  * Filter By Category.
#  *
#  * The Filter By Category extension is for CMS Opencart 3.x Admin Panel.
#  * It allows to filter products by category.
#  *
#  * @author      Andrii Burkatskyi aka underr underr.ua@gmail.com
#  * @copyright   Copyright (c) 2018-2019 Andrii Burkatskyi
#  * @license     https://raw.githubusercontent.com/underr-ua/ocmod3-filter-by-category/master/LICENSE.txt MIT
#  *
#  * @version     1.6
#  *
#  * @see         https://www.opencart.com/index.php?route=marketplace/extension/info&extension_id=34415
#  * @see         https://underr.space/notes/projects/project-007.html
#  * @see         https://github.com/underr-ua/ocmod3-filter-by-category

zip=$(shell basename `pwd`).ocmod.zip

license=LICENSE.txt
readme=README.md
datetime=201901010000.00
src=src
bin=bin


all: clean makedir timestamp makezip

makedir:
	mkdir -p "$(bin)"

timestamp:
	find . -exec touch -a -m -t $(datetime) {} \;

makezip:
	cd "$(src)" && zip -9qrX "../$(bin)/$(zip)" * && cd .. && zip -9qrX "$(bin)/$(zip)" "$(readme)" "$(license)"

clean:
	@echo Cleaning...
	@rm -f "$(bin)"/*.*
	@rm -f "$(src)"/*.zip
	@rm -f "$(src)/$(license)"
	@rm -f "$(src)/$(readme)"
