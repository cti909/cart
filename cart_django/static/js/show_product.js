// dung jquery, js ko chay vi chua load het du lieu dau vao dc
$(document).ready(function() {    
    // url field sort page
    let sort_field = document.getElementById("field").value;
    let sort_name = document.querySelector('input[name="sort"]:checked').value;
    let select = document.querySelector('#field');
    let sort = document.querySelectorAll('input[name="sort"]');
    let page_current = 1;
    let searchText = window.search_product

    select.addEventListener('change', (event) => {
        sort_field = event.target.value;
        window.location.href = "?sort_field="+sort_field+"&sort_name="+sort_name+"&search_token="+searchText+"&page="+""+1
    });

    sort.forEach(option => {
        option.addEventListener('change', (event) => {
            sort_name = event.target.value
            window.location.href = "?sort_field="+sort_field+"&sort_name="+sort_name+"&search_token="+searchText+"&page="+""+1
        });
    });

    const form = document.getElementById('search_product_name');
    form.addEventListener('submit', function(event) {
        event.preventDefault();
        let product_search = document.getElementById("search_product")
        let searchText = product_search.value.toLowerCase();
        window.location.href = "?sort_field="+sort_field+"&sort_name="+sort_name+"&search_token="+searchText+"&page="+""+1
    });
    // -----pagination-----
     
    let paginationUl = document.getElementById("pagination");

    // Tạo nút Previous
    let prevPageLi = document.createElement("li");
    prevPageLi.classList.add("page-item");
    prevPageLi.setAttribute("id", "pagination_prev");
    let prevPageLink = document.createElement("a");
    prevPageLink.classList.add("page-link");
    let prevPageIcon = document.createElement("i");
    prevPageIcon.classList.add("fa-solid", "fa-angle-left");
    prevPageLink.appendChild(prevPageIcon);
    prevPageLi.appendChild(prevPageLink);
    paginationUl.appendChild(prevPageLi);
    if (window.page_current == 1) {
        prevPageLi.classList.add("disabled");
    }
    prevPageLink.addEventListener("click", function(event) {
        event.preventDefault();
        window.location.href = "?sort_field="+sort_field+"&sort_name="+sort_name+"&search_token="+searchText+"&page="+""+(window.page_current-1)
    });

    // Tạo các nút trang
    for (let i = 1; i <= window.page_count; i++) {
    let pageLi = document.createElement("li");
    pageLi.classList.add("page-item");
    if (i == window.page_current) {
        pageLi.classList.add("active");
    }
    let pageLink = document.createElement("a");
    pageLink.classList.add("page-link");
    pageLink.setAttribute("href", "?sort_field="+sort_field+"&sort_name="+sort_name+"&search_token="+searchText+"&page="+""+i);
    pageLink.innerText = i;
    pageLi.appendChild(pageLink);
    paginationUl.appendChild(pageLi);
    }

    // Tạo nút Next
    let nextPageLi = document.createElement("li");
    nextPageLi.classList.add("page-item");
    nextPageLi.setAttribute("id", "pagination_next");
    let nextPageLink = document.createElement("a");
    nextPageLink.classList.add("page-link");
    let nextPageIcon = document.createElement("i");
    nextPageIcon.classList.add("fa-solid", "fa-angle-right");
    nextPageLink.appendChild(nextPageIcon);
    nextPageLi.appendChild(nextPageLink);
    paginationUl.appendChild(nextPageLi);
    if (window.page_current == window.page_count || window.page_count == 0) {
        nextPageLi.classList.add("disabled");
    }
    nextPageLink.addEventListener("click", function(event) {
        event.preventDefault();
        window.location.href = "?sort_field="+sort_field+"&sort_name="+sort_name+"&search_token="+searchText+"&page="+""+(window.page_current+1)
    });

    // -----end pagination-----

    let categories = window.categories;
    let category_list = [];
    // console.log(categories);

    categories.forEach((element) => {
        if (element.parent_id != "None"){
            categories.forEach((element_parent) => {
                if (element_parent.id == element.parent_id){
                    element_parent.list.push(element)
                    return;
                }
            })
        }
    })
    categories.forEach((element) => {
        if (element.parent_id == "None"){
            category_list.push(element);
        }
    })
    // console.log(category_list);
    let show_categories = (category_list) => {
        let categories = document.getElementById('categories');
        str =
        "<li class='nav-item'>"
        +"  <a class='nav-link' aria-current='page' href='/products/product_category/0'>"
        +"        <i class='fa-solid fa-house'></i>"
        +"      All"
        +"  </a>"
        +"</li>"
        
        for(let i=0; i<category_list.length; i++) {
            // console.log(category_list[i].list.length)
            str += 
            "<li class='nav-item dropdown'>"
            +"<a class='nav-link dropdown-toggle text-capitalize' href='#' role='button' data-bs-toggle='dropdown' aria-expanded='false'>"
            +   category_list[i].name
            +"</a>"
            +"<ul class='dropdown-menu' aria-labelledby='navbarDropdown'>"
            +"    <li>"
            +"        <a class='dropdown-item text-center text-capitalize' href="+category_list[i].url+">"
            +"            <strong>"+category_list[i].name+"</strong>"
            +"        </a>"
            +"    </li>"
            if(category_list[i].list.length >0) {
                category_list[i].list.forEach((categories_lv1) =>{
                    str +=
                    "<li><hr class='dropdown-divider'></li>"
                    +"<li><a class='dropdown-item text-capitalize' href='"+categories_lv1.url+"'><strong>"+categories_lv1.name+"</strong></a></li>"
                    
                    if(categories_lv1.list.length >0) {
                        categories_lv1.list.forEach((categories_lv2) => {
                            str +=
                            "<li><a class='dropdown-item text-capitalize' href='"+categories_lv2.url+"'>- "+categories_lv2.name+"</a></li>"
                        })
                    }
                })
                    
            }
            str += "</ul>"
            str += "</li>"
        }
        categories.innerHTML += str;
    }
    show_categories(category_list);
})