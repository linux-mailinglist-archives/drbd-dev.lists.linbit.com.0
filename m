Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC503B1315
	for <lists+drbd-dev@lfdr.de>; Wed, 23 Jun 2021 06:56:40 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D0F2D4205D5;
	Wed, 23 Jun 2021 06:56:39 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 531 seconds by postgrey-1.31 at mail19;
	Tue, 22 Jun 2021 14:27:27 CEST
Received: from proxmox-new.maurer-it.com (proxmox-new.maurer-it.com
	[94.136.29.106])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C4B6142000A
	for <drbd-dev@lists.linbit.com>; Tue, 22 Jun 2021 14:27:27 +0200 (CEST)
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
	by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 89ADE44B66;
	Tue, 22 Jun 2021 14:18:35 +0200 (CEST)
From: Wolfgang Bumiller <w.bumiller@proxmox.com>
To: pve-devel@lists.proxmox.com
Date: Tue, 22 Jun 2021 14:18:21 +0200
Message-Id: <20210622121828.84178-3-w.bumiller@proxmox.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210622121828.84178-1-w.bumiller@proxmox.com>
References: <20210622121828.84178-1-w.bumiller@proxmox.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 23 Jun 2021 06:56:38 +0200
Cc: drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH v2 storage 2/5] bump storage API: update
	import/export methods
X-BeenThere: drbd-dev@lists.linbit.com
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: "*Coordination* of development, patches,
	contributions -- *Questions* \(even to developers\) go to drbd-user,
	please." <drbd-dev.lists.linbit.com>
List-Unsubscribe: <https://lists.linbit.com/mailman/options/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=unsubscribe>
List-Archive: <http://lists.linbit.com/pipermail/drbd-dev>
List-Post: <mailto:drbd-dev@lists.linbit.com>
List-Help: <mailto:drbd-dev-request@lists.linbit.com?subject=help>
List-Subscribe: <https://lists.linbit.com/mailman/listinfo/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

Bumps APIVER to 9 and resets APIAGE to zero.

The import methods (volume_import, volume_import_formats):

These additionally get the '$snapshot' parameter which is
already present on the export side as an informational piece
to know which of the snapshots is the *current* one.
This parameter is inserted *in the middle* of the current
parameters, so the import & export format methods now have
the same signatures.
The current "disk" state will be set to this snapshot.
This, too, is required for our btrfs implementation.
  `volume_import_formats` can obviously not make much
*use* of this parameter, but it'll still be useful to know
that the information is actually available in the import
call, so its presence will be checked in the btrfs
implementation.

Currently this is intended to be used for btrfs send/recv
support, which in theory could also get additional metadata
similar to how we do the "tar+size" format, however, we
currently only really use this within this repository in
storage_migrate() which has this information readily
available anyway.

On the export side (volume_export, volume_export_formats):

The `$with_snapshots` option is now "defined" to be an
ordered array of snapshots to include, as a hint for
storages which need this. (As of the next commit this is
only btrfs, and only when also specifying a base snapshot,
which is a case we can currently not run into except on the
command line interface.)
  The current providers of the `with_snapshot` option will
still treat it as a boolean (since eg. for ZFS you cannot
really "skip" snapshots AFAIK).
  This is mainly intended for storages which do not have a
strong association between snapshots and the originals, or
an ordering (eg. btrfs and lvm-thin allow creating
arbitrary snapshot trees, and with btrfs you can even
create a "circular" connection between subvolumes, also we
could consider reflink based copies snapshots on xfs in
the future maybe?)

Signed-off-by: Wolfgang Bumiller <w.bumiller@proxmox.com>
---
To be explicit about this: this is meant for pve-7 only, merging this to
pve-6 would cause unnecessary churn to users of custom plugins.

Changes to v1:
  for a more consistent api, the snapshot parameter of
  `volume_import_formats` has been moved from the end to the same
  position as in the `volume_export_formats` method, so they have
  matching signatures, since this is a major API change and

As a heads up:

Cc: drbd-dev@lists.linbit.com

This will affect the LINSTOR drbd plugin, so Ccing drbd-devel.
AFAICT the plugin doesn't override the affected methods, so it should be
enough to just bump the returned version number in the `api` sub for
`$apiver >= 9`.


 ApiChangeLog                 | 25 ++++++++++++++++++
 PVE/CLI/pvesm.pm             | 23 +++++++++++++++--
 PVE/Storage.pm               | 50 ++++++++++++++++++++++++------------
 PVE/Storage/LVMPlugin.pm     |  6 ++---
 PVE/Storage/Plugin.pm        |  4 +--
 PVE/Storage/ZFSPoolPlugin.pm |  6 ++---
 6 files changed, 87 insertions(+), 27 deletions(-)
 create mode 100644 ApiChangeLog

diff --git a/ApiChangeLog b/ApiChangeLog
new file mode 100644
index 0000000..8c119c5
--- /dev/null
+++ b/ApiChangeLog
@@ -0,0 +1,25 @@
+# API Versioning ChangeLog
+
+Our API versioning contains an `APIVER` and an `APIAGE`.
+The `APIAGE` is the number of versions we're backward compatible with. (iow.  things got added
+without breaking anything unaware of it.)
+
+Future changes should be documented in here.
+
+##  Version 9: (AGE resets to 0):
+
+* volume_import_formats gets a new parameter *inserted*:
+
+  Old signature:
+      sub($plugin, $scfg, $storeid, $volname, $base_snapshot, $with_snapshots)
+  New signature:
+      sub($plugin, $scfg, $storeid, $volname, $snapshot, $base_snapshot, $with_snapshots)
+
+  This is now the same as `volume_export_formats`.
+
+  The same goes for calls to `PVE::Storage::volume_import_formats`, which now
+  takes a `$snapshot` parameter in the same place.
+
+* $with_snapshots *may* now be an array reference containing an ordered list of
+  snapshots, but *may* also just be a boolean, and the contained list *may* be
+  ignored, so it can still be treated as a boolean.
diff --git a/PVE/CLI/pvesm.pm b/PVE/CLI/pvesm.pm
index d28f1ba..4491107 100755
--- a/PVE/CLI/pvesm.pm
+++ b/PVE/CLI/pvesm.pm
@@ -276,12 +276,23 @@ __PACKAGE__->register_method ({
 		optional => 1,
 		default => 0,
 	    },
+	    'snapshot-list' => {
+		description => "Ordered list of snapshots to transfer",
+		type => 'string',
+		format => 'string-list',
+		optional => 1,
+	    },
 	},
     },
     returns => { type => 'null' },
     code => sub {
 	my ($param) = @_;
 
+	my $with_snapshots = $param->{'with-snapshots'};
+	if (defined(my $list = $param->{'snapshot-list'})) {
+	    $with_snapshots = PVE::Tools::split_list($list);
+	}
+
 	my $filename = $param->{filename};
 
 	my $outfh;
@@ -295,7 +306,7 @@ __PACKAGE__->register_method ({
 	eval {
 	    my $cfg = PVE::Storage::config();
 	    PVE::Storage::volume_export($cfg, $outfh, $param->{volume}, $param->{format},
-		$param->{snapshot}, $param->{base}, $param->{'with-snapshots'});
+		$param->{snapshot}, $param->{base}, $with_snapshots);
 	};
 	my $err = $@;
 	if ($filename ne '-') {
@@ -361,6 +372,13 @@ __PACKAGE__->register_method ({
 		optional => 1,
 		default => 0,
 	    },
+	    snapshot => {
+		description => "The current-state snapshot if the stream contains snapshots",
+		type => 'string',
+		pattern => qr/[a-z0-9_\-]{1,40}/i,
+		maxLength => 40,
+		optional => 1,
+	    },
 	},
     },
     returns => { type => 'string' },
@@ -436,7 +454,8 @@ __PACKAGE__->register_method ({
 	my $volume = $param->{volume};
 	my $delete = $param->{'delete-snapshot'};
 	my $imported_volid = PVE::Storage::volume_import($cfg, $infh, $volume, $param->{format},
-	    $param->{base}, $param->{'with-snapshots'}, $param->{'allow-rename'});
+	    $param->{snapshot}, $param->{base}, $param->{'with-snapshots'},
+	    $param->{'allow-rename'});
 	PVE::Storage::volume_snapshot_delete($cfg, $imported_volid, $delete)
 	    if defined($delete);
 	return $imported_volid;
diff --git a/PVE/Storage.pm b/PVE/Storage.pm
index e0d6f44..5ca052f 100755
--- a/PVE/Storage.pm
+++ b/PVE/Storage.pm
@@ -41,11 +41,11 @@ use PVE::Storage::PBSPlugin;
 use PVE::Storage::BTRFSPlugin;
 
 # Storage API version. Increment it on changes in storage API interface.
-use constant APIVER => 8;
+use constant APIVER => 9;
 # Age is the number of versions we're backward compatible with.
 # This is like having 'current=APIVER' and age='APIAGE' in libtool,
 # see https://www.gnu.org/software/libtool/manual/html_node/Libtool-versioning.html
-use constant APIAGE => 7;
+use constant APIAGE => 0;
 
 # load standard plugins
 PVE::Storage::DirPlugin->register();
@@ -714,7 +714,8 @@ sub storage_migrate {
     my $send = ['pvesm', 'export', $volid, $format, '-', '-with-snapshots', $with_snapshots];
     my $recv = [@$ssh, '--', 'pvesm', 'import', $target_volid, $format, $import_fn, '-with-snapshots', $with_snapshots];
     if (defined($snapshot)) {
-	push @$send, '-snapshot', $snapshot
+	push @$send, '-snapshot', $snapshot;
+	push @$recv, '-snapshot', $snapshot;
     }
     if ($migration_snapshot) {
 	push @$recv, '-delete-snapshot', $snapshot;
@@ -724,7 +725,7 @@ sub storage_migrate {
     if (defined($base_snapshot)) {
 	# Check if the snapshot exists on the remote side:
 	push @$send, '-base', $base_snapshot;
-	push @$recv, '-base', $base_snapshot;
+	push @$recv, '-base', $base_snapshot if $target_apiver >= 9;
     }
 
     my $new_volid;
@@ -1712,7 +1713,7 @@ sub prune_mark_backup_group {
     }
 }
 
-sub volume_export {
+sub volume_export : prototype($$$$$$$) {
     my ($cfg, $fh, $volid, $format, $snapshot, $base_snapshot, $with_snapshots) = @_;
 
     my ($storeid, $volname) = parse_volume_id($volid, 1);
@@ -1723,18 +1724,27 @@ sub volume_export {
                                   $snapshot, $base_snapshot, $with_snapshots);
 }
 
-sub volume_import {
-    my ($cfg, $fh, $volid, $format, $base_snapshot, $with_snapshots, $allow_rename) = @_;
+sub volume_import : prototype($$$$$$$$) {
+    my ($cfg, $fh, $volid, $format, $snapshot, $base_snapshot, $with_snapshots, $allow_rename) = @_;
 
     my ($storeid, $volname) = parse_volume_id($volid, 1);
     die "cannot import into volume '$volid'\n" if !$storeid;
     my $scfg = storage_config($cfg, $storeid);
     my $plugin = PVE::Storage::Plugin->lookup($scfg->{type});
-    return $plugin->volume_import($scfg, $storeid, $fh, $volname, $format,
-                                  $base_snapshot, $with_snapshots, $allow_rename) // $volid;
-}
-
-sub volume_export_formats {
+    return $plugin->volume_import(
+	$scfg,
+	$storeid,
+	$fh,
+	$volname,
+	$format,
+	$snapshot,
+	$base_snapshot,
+	$with_snapshots,
+	$allow_rename,
+    ) // $volid;
+}
+
+sub volume_export_formats : prototype($$$$$) {
     my ($cfg, $volid, $snapshot, $base_snapshot, $with_snapshots) = @_;
 
     my ($storeid, $volname) = parse_volume_id($volid, 1);
@@ -1746,21 +1756,27 @@ sub volume_export_formats {
                                           $with_snapshots);
 }
 
-sub volume_import_formats {
-    my ($cfg, $volid, $base_snapshot, $with_snapshots) = @_;
+sub volume_import_formats : prototype($$$$$) {
+    my ($cfg, $volid, $snapshot, $base_snapshot, $with_snapshots) = @_;
 
     my ($storeid, $volname) = parse_volume_id($volid, 1);
     return if !$storeid;
     my $scfg = storage_config($cfg, $storeid);
     my $plugin = PVE::Storage::Plugin->lookup($scfg->{type});
-    return $plugin->volume_import_formats($scfg, $storeid, $volname,
-                                          $base_snapshot, $with_snapshots);
+    return $plugin->volume_import_formats(
+	$scfg,
+	$storeid,
+	$volname,
+	$snapshot,
+	$base_snapshot,
+	$with_snapshots,
+    );
 }
 
 sub volume_transfer_formats {
     my ($cfg, $src_volid, $dst_volid, $snapshot, $base_snapshot, $with_snapshots) = @_;
     my @export_formats = volume_export_formats($cfg, $src_volid, $snapshot, $base_snapshot, $with_snapshots);
-    my @import_formats = volume_import_formats($cfg, $dst_volid, $base_snapshot, $with_snapshots);
+    my @import_formats = volume_import_formats($cfg, $dst_volid, $snapshot, $base_snapshot, $with_snapshots);
     my %import_hash = map { $_ => 1 } @import_formats;
     my @common = grep { $import_hash{$_} } @export_formats;
     return @common;
diff --git a/PVE/Storage/LVMPlugin.pm b/PVE/Storage/LVMPlugin.pm
index b85fb89..b5fa9d6 100644
--- a/PVE/Storage/LVMPlugin.pm
+++ b/PVE/Storage/LVMPlugin.pm
@@ -603,7 +603,7 @@ sub volume_has_feature {
 sub volume_export_formats {
     my ($class, $scfg, $storeid, $volname, $snapshot, $base_snapshot, $with_snapshots) = @_;
     return () if defined($snapshot); # lvm-thin only
-    return volume_import_formats($class, $scfg, $storeid, $volname, $base_snapshot, $with_snapshots);
+    return volume_import_formats($class, $scfg, $storeid, $volname, $snapshot, $base_snapshot, $with_snapshots);
 }
 
 sub volume_export {
@@ -627,14 +627,14 @@ sub volume_export {
 }
 
 sub volume_import_formats {
-    my ($class, $scfg, $storeid, $volname, $base_snapshot, $with_snapshots) = @_;
+    my ($class, $scfg, $storeid, $volname, $snapshot, $base_snapshot, $with_snapshots) = @_;
     return () if $with_snapshots; # not supported
     return () if defined($base_snapshot); # not supported
     return ('raw+size');
 }
 
 sub volume_import {
-    my ($class, $scfg, $storeid, $fh, $volname, $format, $base_snapshot, $with_snapshots, $allow_rename) = @_;
+    my ($class, $scfg, $storeid, $fh, $volname, $format, $snapshot, $base_snapshot, $with_snapshots, $allow_rename) = @_;
     die "volume import format $format not available for $class\n"
 	if $format ne 'raw+size';
     die "cannot import volumes together with their snapshots in $class\n"
diff --git a/PVE/Storage/Plugin.pm b/PVE/Storage/Plugin.pm
index d330845..8803e65 100644
--- a/PVE/Storage/Plugin.pm
+++ b/PVE/Storage/Plugin.pm
@@ -1402,7 +1402,7 @@ sub volume_export_formats {
 
 # Import data from a stream, creating a new or replacing or adding to an existing volume.
 sub volume_import {
-    my ($class, $scfg, $storeid, $fh, $volname, $format, $base_snapshot, $with_snapshots, $allow_rename) = @_;
+    my ($class, $scfg, $storeid, $fh, $volname, $format, $snapshot, $base_snapshot, $with_snapshots, $allow_rename) = @_;
 
     die "volume import format '$format' not available for $class\n"
 	if $format !~ /^(raw|tar|qcow2|vmdk)\+size$/;
@@ -1462,7 +1462,7 @@ sub volume_import {
 }
 
 sub volume_import_formats {
-    my ($class, $scfg, $storeid, $volname, $base_snapshot, $with_snapshots) = @_;
+    my ($class, $scfg, $storeid, $volname, $snapshot, $base_snapshot, $with_snapshots) = @_;
     if ($scfg->{path} && !defined($base_snapshot)) {
 	my $format = ($class->parse_volname($volname))[6];
 	if ($with_snapshots) {
diff --git a/PVE/Storage/ZFSPoolPlugin.pm b/PVE/Storage/ZFSPoolPlugin.pm
index 2e2abe3..c4be70f 100644
--- a/PVE/Storage/ZFSPoolPlugin.pm
+++ b/PVE/Storage/ZFSPoolPlugin.pm
@@ -747,7 +747,7 @@ sub volume_export_formats {
 }
 
 sub volume_import {
-    my ($class, $scfg, $storeid, $fh, $volname, $format, $base_snapshot, $with_snapshots, $allow_rename) = @_;
+    my ($class, $scfg, $storeid, $fh, $volname, $format, $snapshot, $base_snapshot, $with_snapshots, $allow_rename) = @_;
 
     die "unsupported import stream format for $class: $format\n"
 	if $format ne 'zfs';
@@ -784,9 +784,9 @@ sub volume_import {
 }
 
 sub volume_import_formats {
-    my ($class, $scfg, $storeid, $volname, $base_snapshot, $with_snapshots) = @_;
+    my ($class, $scfg, $storeid, $volname, $snapshot, $base_snapshot, $with_snapshots) = @_;
 
-    return $class->volume_export_formats($scfg, $storeid, $volname, undef, $base_snapshot, $with_snapshots);
+    return $class->volume_export_formats($scfg, $storeid, $volname, $snapshot, $base_snapshot, $with_snapshots);
 }
 
 1;
-- 
2.30.2


_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
