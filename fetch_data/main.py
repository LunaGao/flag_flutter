from urllib import request
from urllib import error
from bs4 import BeautifulSoup

un_member_states_url = 'https://www.un.org/en/member-states/index.html'
flag_template = 'https://commons.wikimedia.org/wiki/File:Flag_of_{member_name}.svg'

response = request.urlopen(un_member_states_url)
un_html = response.read().decode('utf-8')

soup = BeautifulSoup(un_html, 'html.parser')

# <span class="member-state-name">
for span in soup.find_all('span', class_='member-state-name'):
    member_short_name = span.find_previous('div', class_='member-state col-md-12')['id']
    member_full_name = span.get_text()
    member_full_name_url = member_full_name.replace(' ', '_')

    try:
        svg_html_url = flag_template.replace('{member_name}', member_full_name_url)
        response = request.urlopen(svg_html_url)
        flag_html = response.read().decode('utf-8')
        soup_flag = BeautifulSoup(flag_html, 'html.parser')
        request.urlretrieve(soup_flag.find('a', class_='internal')['href'], './flag/' + member_short_name + '.svg')
    except error.HTTPError as e:
        print(member_short_name)
        print(member_full_name_url)
    except error.URLError as e:
        print(member_short_name)
        print(member_full_name_url)
    except:
        print(member_short_name)
        print(member_full_name_url)
    # flag_url = 'https://commons.wikimedia.org/wiki/File:Flag_of_Antigua_and_Barbuda.svg'
    #
    #
    # # <a class="internal" href="https://upload.wikimedia.org/wikipedia/commons/8/89/Flag_of_Antigua_and_Barbuda.svg" title="Flag of Antigua and Barbuda.svg">
    # #         Original file
    # #        </a>
    # urllib.request.urlretrieve(soup.find('a', class_='internal')['href'], 'a.svg')
    # print(soup.find('a', class_='internal')['href'])
