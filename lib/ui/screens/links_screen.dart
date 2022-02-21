import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get_it/get_it.dart';
import 'package:nu_bank_test/core/models/link.dart';
import 'package:nu_bank_test/core/providers/links_provider.dart';
import 'package:nu_bank_test/core/services/shortener_service.dart';
import 'package:nu_bank_test/ui/constants/values.dart';
import 'package:nu_bank_test/ui/widgets/link_list_tile.dart';
import 'package:provider/provider.dart';

class LinksScreen extends StatefulWidget {
  const LinksScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _LinksScreenState();
  }
}

class _LinksScreenState extends State<LinksScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _loading = false;

  Widget _buildBody() {
    return Column(
      children: [
        _buildForm(),
        Expanded(
          child: _buildListView(),
        ),
      ],
    );
  }

  Widget _buildForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Value.horizontalSpacing,
        vertical: Value.verticalSpacing,
      ),
      child: Column(
        children: [
          FormBuilder(
            key: _formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Column(
              children: [
                FormBuilderTextField(
                  name: 'url',
                  decoration: const InputDecoration(
                    labelText: 'URL',
                    border: OutlineInputBorder(),
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context),
                    FormBuilderValidators.url(context),
                  ]),
                  keyboardType: TextInputType.url,
                ),
              ],
            ),
          ),
          MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            elevation: 0.0,
            color: Theme.of(context).colorScheme.secondary,
            child: Text(
              'shorten'.tr(),
              style: const TextStyle(color: Colors.white),
            ),
            onPressed: _loading ? null : _shorten,
          ),
        ],
      ),
    );
  }

  Widget _buildListView() {
    // Retrieve links from state managemente providers
    List<Link> links = context.watch<LinksProvider>().links.reversed.toList();
    if (links.isEmpty) {
      return Center(
        child: Text(
          'empty'.tr(),
          textAlign: TextAlign.left,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Value.horizontalSpacing,
              vertical: Value.defaultSpacing,
            ),
            child: Text(
              'recent'.tr(),
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const Divider(
                indent: Value.horizontalSpacing,
                endIndent: Value.horizontalSpacing,
                color: Colors.grey,
              ),
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => LinkListTile(link: links[index]),
              itemCount: links.length,
            ),
          ),
        ],
      );
    }
  }

  void _shorten() async {
    _formKey.currentState?.save();
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _loading = true;
      });

      String url = _formKey.currentState?.value['url'] ?? '';

      // Call shorten link service
      Link link = await GetIt.I.get<ShortenerService>().shortenLink(url: url);

      // Add link into state management
      context.read<LinksProvider>().addLink(link);

      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Iuerel',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: _buildBody(),
    );
  }
}
