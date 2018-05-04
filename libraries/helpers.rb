#
# Cookbook Name:: kibana5
# Library:: helpers
#
# Copyright:: 2017, Parallels International GmbH
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

module Kibana
  module Helpers
    # Returns download URL for Kibana artifact
    def kibana_artifact_url(version, install_method)
      return node['kibana5']['url'] unless node['kibana5']['url'].nil?

      case install_method
      when 'release'
        "#{node['kibana5']['distribution_base_url']}/kibana-#{version}-linux-#{kibana_arch}.tar.gz"
      when 'windows'
        "#{node['kibana5']['distribution_base_url']}/kibana-#{version}-windows-x86.zip"
      when 'darwin'
        "#{node['kibana5']['distribution_base_url']}/kibana-#{version}-darwin-x86_64.tar.gz"
      end
    end

    # Returns SHA256 checksum of specific Kibana artifact
    def kibana_artifact_checksum(version, install_method)
      return node['kibana5']['checksum'] unless node['kibana5']['checksum'].nil?

      sums = kibana_checksum_map[version]
      raise "Kibana version #{version} is not supported by the cookbook!" unless sums

      begin
        case install_method
        when 'release'
          sums['release'][kibana_arch]['checksum']
        when 'windows'
          sums['windows']['x86']['checksum']
        end
      rescue
        raise "Install method #{install_method} is not supported for this version of Kibana!"
      end
    end

    def kibana_arch
      (node['kernel']['machine'] == 'x86_64') ? 'x86_64' : 'x86'
    end

    # Returns SHA256 checksum map for Kibana artifacts
    def kibana_checksum_map
      {
        '5.6.9' => {
          'release' => {
            'x86_64' => {
              'checksum' => '92ec07aa8ea0fe71a2dfd7969e3eca9e2e2bf198b8f44579667a56546591e4e5',
            },
            'x86' => {
              'checksum' => '1d9fc2bfc63764b0329236b71adbf436830b1af41e0c7985b67708a7537f5c93',
            },
          },
          'windows' => {
            'x86' => {
              'checksum' => '32d990fccfa86aff57ad7c665ef097682ff6e998a5054a237b004b1acb788f38',
            },
          },
          'darwin' => {
            'x86_64' => {
              'checksum' => '53504ae5134a352a6f020eddd07fa04af4fdb635653d6959ece4747b481e8182',
            },
          },
        },
        '5.6.8' => {
          'release' => {
            'x86_64' => {
              'checksum' => '2d8516bd9ffee561c31eba4f3b3488b190308fbd72813bf17713992046bc0f42',
            },
            'x86' => {
              'checksum' => '5bc64ceb2c94f0494dac94db954b478b83d7944a93423a9db783f62f9106f0e8',
            },
          },
          'windows' => {
            'x86' => {
              'checksum' => '70689bf053c5afa3f50edc23fb0ad11215663e72bc05ea6b1b3c64ae8fb6a425',
            },
          },
          'darwin' => {
            'x86_64' => {
              'checksum' => 'f94f6ea06bdba2199ca9f4173a98d547e198431133cc735123362eb2e0638b04',
            },
          },
        },
        '5.6.7' => {
          'release' => {
            'x86_64' => {
              'checksum' => 'fb3308fb432296e935ddf100ffdf7ad450470603df7f518a2d0b035483ec0a30',
            },
            'x86' => {
              'checksum' => '02cb8e0c7064247579617253ecfc27384fea4f3ecbba3e90c0cbc4f49a1ab4fe',
            },
          },
          'windows' => {
            'x86' => {
              'checksum' => 'd4056c384f476005d3811aa57b4f4493d0df475939eb963fc7a94abc21079a3b',
            },
          },
          'darwin' => {
            'x86_64' => {
              'checksum' => 'b9bb3fb9d166f157f69ea87cf9d9b9935badb0ca0cafc46b17c3ed1669c9eec9',
            },
          },
        },
        '5.6.2' => {
          'release' => {
            'x86_64' => {
              'checksum' => 'd4fb6a736c367d8df563f405bdc3c6d6541e1a8fe0b22d29c8070c032ca97cd8',
            },
            'x86' => {
              'checksum' => 'de69314c6616ca9e467b67c9b3800ca1c1cc843a8709a4cb435ba017a3affcc8',
            },
          },
          'windows' => {
            'x86' => {
              'checksum' => 'c0b6ad3fdae1de6536ed3478b400013a92942e45b4c24f089d9aa678dbce23f9',
            },
          },
          'darwin' => {
            'x86_64' => {
              'checksum' => 'ff8ec244f552c3f087c5026d6ceb6d14f3e67a6b2bfeebabebef8b6edb8ffc4b',
            },
          },
        },
        '5.5.2' => {
          'release' => {
            'x86_64' => {
              'checksum' => '4b879a36899d886c1264c6c2e0c662d56ebefee703fa4c62bca793124d3ebd5a',
            },
            'x86' => {
              'checksum' => 'f74e16d73da0b31e8c04276b13f755c49f95e59209079adbefff40cd56e5a62a',
            },
          },
          'windows' => {
            'x86' => {
              'checksum' => '9b3014d095543566b6cbff8de7013889ba7e3e49ac8365b7310f51843a9036a6',
            },
          },
          'darwin' => {
            'x86_64' => {
              'checksum' => 'f4ee5bd790aa9d2a7e6747a193c1ba5e7d6ce70c59bb2787624e44f2f5a7564e',
            },
          },
        },
        '5.4.1' => {
          'release' => {
            'x86_64' => {
              'checksum' => 'efab73464c6cbc90089acf9275e43c7b3c2bbe8fb62c710567ac523a65c3394b',
            },
            'x86' => {
              'checksum' => '25b309435ae4760332e2072e80a83848852245f5c91af6f72bf09771a0bd73fa',
            },
          },
          'windows' => {
            'x86' => {
              'checksum' => 'bf88a207b5d4be62c02b83cf2d1cce14aac1a48a9feb084817b93e4690b00983',
            },
          },
          'darwin' => {
            'x86_64' => {
              'checksum' => 'ea66827790ed6dbce241ccdee37e25f3da6ea01c0b1ca5a018032cef626c6239',
            },
          },
        },
        '5.4.0' => {
          'release' => {
            'x86_64' => {
              'checksum' => '58838dcb5b3195455e1eb05926fed27d882a3476370facfc35d39d837940b1bc',
            },
            'x86' => {
              'checksum' => 'fbeda3f125cd95cc914c1eb49f65313eb55ce65c9300f231f2d050f4c6bbb65f',
            },
          },
          'windows' => {
            'x64' => {
              'checksum' => '9c3c36c042962794b1eb9f45a585302f3eb4c01aecca7c06fb53097b7e7d2852',
            },
          },
        },
        '5.3.0' => {
          'release' => {
            'x86_64' => {
              'checksum' => 'f31369c32d655370f0e51290018004cfbc54e2d648f0f79dba88e36b4d6cce6f',
            },
            'x86' => {
              'checksum' => 'eddc77334032ed30f98289715781d01e7677d598cf4a3ad5595618cc057a8bfc',
            },
          },
          'windows' => {
            'x64' => {
              'checksum' => '56c5fbd5767dea313ab11489cfed6da063677f9ad38fe9c0420535a46bfdbdaf',
            },
          },
        },
        '5.2.2' => {
          'release' => {
            'x86_64' => {
              'checksum' => '9c7c526ce286da7f63aed9fb9f9d752ec182ff16bf374c55e55e5a0536a33563',
            },
            'x86' => {
              'checksum' => 'de0421728aca00e9d4114b45ad5519b843b700006eb0795fcc2df4371d6baa1d',
            },
          },
          'windows' => {
            'x64' => {
              'checksum' => '8d6435aa6cfef1a8ce8d4a84361139d0ea3848abfe87283765b4da4fbaefdd3f',
            },
          },
        },
        '5.2.1' => {
          'release' => {
            'x86_64' => {
              'checksum' => '82f06fc998385f08eac1c26bb0a48b29a34d179fdb7d0e8be216b35782f12bff',
            },
            'x86' => {
              'checksum' => 'c3f27b73e29a9b51a89b9b58798a0ea087df29978424255acb441a8b3e3540bf',
            },
          },
          'windows' => {
            'x64' => {
              'checksum' => '8753db954a89a7a5c19a2c93886b523d1f8054bd31ce24c772bd873555a949d8',
            },
          },
        },
        '5.2.0' => {
          'release' => {
            'x86_64' => {
              'checksum' => '729af8ab00f719f2038f6c499e508744b274487756e0214b660535ebead6f28a',
            },
            'x86' => {
              'checksum' => '9df75d2dc05937064f1ec905edc705ab1a83e8aaddef6b2fa90b2826f6cc2ea4',
            },
          },
          'windows' => {
            'x64' => {
              'checksum' => 'bd1be9758b11b071bc033e9ed996598f4da6cdb18b28c475993c429f1c17db31',
            },
          },
        },
      }
    end
  end
end

::Chef::Recipe.send(:include, Kibana::Helpers)
::Chef::Resource.send(:include, Kibana::Helpers)
::Chef::Provider.send(:include, Kibana::Helpers)
