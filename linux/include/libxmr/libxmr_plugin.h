#ifndef FLUTTER_PLUGIN_LIBXMR_PLUGIN_H_
#define FLUTTER_PLUGIN_LIBXMR_PLUGIN_H_

#include <flutter_linux/flutter_linux.h>

G_BEGIN_DECLS

#ifdef FLUTTER_PLUGIN_IMPL
#define FLUTTER_PLUGIN_EXPORT __attribute__((visibility("default")))
#else
#define FLUTTER_PLUGIN_EXPORT
#endif

typedef struct _LibXmrPlugin LibXmrPlugin;
typedef struct {
  GObjectClass parent_class;
} LibXmrPluginClass;

FLUTTER_PLUGIN_EXPORT GType libxmr_plugin_get_type();

FLUTTER_PLUGIN_EXPORT void libxmr_plugin_register_with_registrar(
    FlPluginRegistrar* registrar);

G_END_DECLS

#endif  // FLUTTER_PLUGIN_FLUTTER_LIBXMR_PLUGIN_H_
