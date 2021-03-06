{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}
winscp:
  {% for version, file_version in [('5.9', '5.9')] %}
  '{{ version }}':
    full_name: 'WinSCP {{ version }}'
    installer: 'https://sourceforge.net/project/winscp/files/WinSCP/{{ version }}/winscp-{{ file_version }}-setup.exe'
    install_flags: '/SP- /verysilent /norestart'
    uninstaller: '{{ PROGRAM_FILES }}\WinSCP\unins000.exe'
    uninstall_flags: '/verysilent'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}
