from urllib import request
from urllib import error
from bs4 import BeautifulSoup

un_member_states_url = 'https://www.un.org/en/member-states/index.html'
flag_template = 'https://commons.wikimedia.org/wiki/File:Flag_of_{member_name}.svg'

response = request.urlopen(un_member_states_url)
un_html = response.read().decode('utf-8')
fw = open("un_members.txt", 'w+')
index = 0

soup = BeautifulSoup(un_html, 'html.parser')

# <span class="member-state-name">
for span in soup.find_all('span', class_='member-state-name'):
    index = index + 1
    member_short_name = span.find_previous('div', class_='member-state col-md-12')['id']
    member_full_name = span.get_text()
    fw.write('(' + str(index) + ')')
    fw.write(member_short_name + '\n')
    fw.write(member_full_name + '\n')
    member_full_name_url = member_full_name.replace(' ', '_')
    if 'bo' in member_short_name:
        member_full_name_url = 'Bolivia'
    elif 'ci' in member_short_name:
        member_full_name_url = 'Côte_d\'Ivoire'
    elif 'kp' in member_short_name:
        member_full_name_url = 'North_Korea'
    elif 'gm' in member_short_name:
        member_full_name_url = 'The_Gambia'
    elif 'gw' in member_short_name:
        member_full_name_url = 'Guinea-Bissau'
    elif 'ir' in member_short_name:
        member_full_name_url = 'Iran'
    elif 'la' in member_short_name:
        member_full_name_url = 'Laos'
    elif 'fm' in member_short_name:
        member_full_name_url = 'the_Federated_States_of_Micronesia'
    elif 'md' in member_short_name:
        member_full_name_url = 'Moldova'
    elif 'sy' in member_short_name:
        member_full_name_url = 'Syria'
    elif 'gb' in member_short_name:
        member_full_name_url = 'the_United_Kingdom'
    elif 'tz' in member_short_name:
        member_full_name_url = 'Tanzania'
    elif 've' in member_short_name:
        member_full_name_url = 'Venezuela'
    elif 'vn' in member_short_name:
        member_full_name_url = 'Vietnam'

    # try:
    #     svg_html_url = flag_template.replace('{member_name}', member_full_name_url)
    #     response = request.urlopen(svg_html_url)
    #     flag_html = response.read().decode('utf-8')
    #     soup_flag = BeautifulSoup(flag_html, 'html.parser')
    #     request.urlretrieve(soup_flag.find('a', class_='internal')['href'], './flag/' + member_short_name + '.svg')
    #     fw.write('====================\n')
    # except error.HTTPError as e:
    #     print(member_short_name)
    #     print(member_full_name_url)
    #     fw.write('ERROR***************\n')
    # except error.URLError as e:
    #     print(member_short_name)
    #     print(member_full_name_url)
    #     fw.write('ERROR***************\n')
    # except:
    #     print(member_short_name)
    #     print(member_full_name_url)
    #     fw.write('ERROR***************\n')
    # flag_url = 'https://commons.wikimedia.org/wiki/File:Flag_of_Antigua_and_Barbuda.svg'
    #
    #
    # # <a class="internal" href="https://upload.wikimedia.org/wikipedia/commons/8/89/Flag_of_Antigua_and_Barbuda.svg" title="Flag of Antigua and Barbuda.svg">
    # #         Original file
    # #        </a>
    # urllib.request.urlretrieve(soup.find('a', class_='internal')['href'], 'a.svg')
    # print(soup.find('a', class_='internal')['href'])
fw.close()
