import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Cubit/App_cubit/app_cubit.dart';
import 'package:news/Cubit/App_cubit/app_state.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreens extends StatelessWidget {
  const WebViewScreens({super.key,required  this.url});
  final String url;
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<AppCubit>(context);
    return Scaffold(
      appBar: AppBar(title: const Text("تفاصيل الخبر")),
      body: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          return Stack(
            children: [
              WebViewWidget(
                controller:
                    WebViewController()
                      ..setJavaScriptMode(JavaScriptMode.unrestricted)
                      ..setNavigationDelegate(
                        NavigationDelegate(
                          onPageStarted: (url) => cubit.startLoading(),
                          onPageFinished: (url) => cubit.finishLoading(),
                          onWebResourceError:
                              (error) => cubit.errorLoading(error.description),
                        ),
                      )
                      ..loadRequest(Uri.parse(url)),
              ),
              if (state is WebViewLoadingAppState)
                const Center(child: CircularProgressIndicator()),
              if (state is WebViewErrorAppState)
                Center(child: Text(state.errMessage)),
            ],
          );
        },
      ),
    );
  }
}
