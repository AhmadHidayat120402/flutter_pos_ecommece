import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos_ecommerce/core/components/components.dart';
import 'package:flutter_pos_ecommerce/core/router/app_router.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/data/models/requests/address_request_model.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/data/models/responses/city_response_model.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/data/models/responses/province_response_model.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/data/models/responses/subdistrict_response_model.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/presentation/address/bloc/add_address/add_address_bloc.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/presentation/address/bloc/city/city_bloc.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/presentation/address/bloc/province/province_bloc.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/presentation/address/bloc/subdistrict/subdistrict_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/address/address_bloc.dart';

class AddAddressPage extends StatefulWidget {
  const AddAddressPage({super.key});

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  final firstNameController = TextEditingController();
  final addressController = TextEditingController();
  final zipCodeController = TextEditingController();
  final phoneNumberController = TextEditingController();

  Provinces selectedProvince = Provinces(
    provinceId: '',
    province: '',
  );

  Cities selectedCity = Cities(
    cityId: '',
  );

  Subdistrict selectedSubdistrict = Subdistrict(
    subdistrictId: '',
  );

  @override
  void initState() {
    context.read<ProvinceBloc>().add(const ProvinceEvent.getProvince());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Adress'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          CustomTextField(
            controller: firstNameController,
            label: 'Nama ',
          ),
          const SpaceHeight(24.0),
          CustomTextField(
            controller: addressController,
            label: 'Alamat Lengkap',
          ),
          const SpaceHeight(24.0),
          BlocBuilder<ProvinceBloc, ProvinceState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                loaded: (provinces) {
                  selectedProvince = provinces.first;
                  return CustomDropdown<Provinces>(
                    value: selectedProvince,
                    items: provinces,
                    label: 'Provinsi',
                    onChanged: (value) {
                      setState(() {
                        selectedProvince = value!;
                        context.read<CityBloc>().add(
                            CityEvent.getCityByProvince(
                                selectedProvince.provinceId!));
                      });
                    },
                  );
                },
              );
            },
          ),
          const SpaceHeight(24.0),
          BlocBuilder<CityBloc, CityState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () => CustomDropdown(
                  value: '-',
                  items: const ['-'],
                  label: 'Kota/Kabupaten',
                  onChanged: (value) {},
                ),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                loaded: (cities) {
                  selectedCity = cities.first;
                  return CustomDropdown<Cities>(
                    value: selectedCity,
                    items: cities,
                    label: 'Kota/Kabupaten',
                    onChanged: (value) {
                      setState(
                        () {
                          selectedCity = value!;
                          context.read<SubdistrictBloc>().add(
                              SubdistrictEvent.getSubdistrictsByCity(
                                  selectedCity.cityId!));
                        },
                      );
                    },
                  );
                },
              );
            },
          ),
          const SpaceHeight(24.0),
          BlocBuilder<SubdistrictBloc, SubdistrictState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () => CustomDropdown(
                  value: '-',
                  items: const ['-'],
                  label: 'Kecamatan',
                  onChanged: (value) {},
                ),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                loaded: (subdistricts) {
                  selectedSubdistrict = subdistricts.first;
                  return CustomDropdown<Subdistrict>(
                    value: selectedSubdistrict,
                    items: subdistricts,
                    label: 'Kecamatan',
                    onChanged: (value) {
                      setState(() {
                        selectedSubdistrict = value!;
                      });
                    },
                  );
                },
              );
            },
          ),
          const SpaceHeight(24.0),
          CustomTextField(
            controller: zipCodeController,
            label: 'Kode Pos',
          ),
          const SpaceHeight(24.0),
          CustomTextField(
            controller: phoneNumberController,
            label: 'No Handphone',
          ),
          const SpaceHeight(24.0),
          BlocConsumer<AddAddressBloc, AddAddressState>(
            listener: (context, state) {
              state.maybeWhen(
                orElse: () {},
                loaded: () {
                  context.goNamed(
                    RouteConstants.address,
                    pathParameters: PathParameters(
                      rootTab: RootTab.order,
                    ).toMap(),
                  );
                  context
                      .read<AddressBloc>()
                      .add(const AddressEvent.getAddress());
                },
              );
            },
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return Button.filled(
                    onPressed: () {
                      context.read<AddAddressBloc>().add(
                            AddAddressEvent.addAddress(
                              addressRequestModel: AddressRequestModel(
                                name: firstNameController.text,
                                fullAddress: addressController.text,
                                provId: selectedProvince.provinceId!,
                                cityId: selectedCity.cityId!,
                                districtId: selectedSubdistrict.subdistrictId!,
                                postalCode: zipCodeController.text,
                                phone: phoneNumberController.text,
                                isDefault: 0,
                              ),
                            ),
                          );
                    },
                    label: 'Tambah Alamat',
                  );
                },
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
