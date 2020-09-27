Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F9C28BBE5
	for <lists+drbd-dev@lfdr.de>; Mon, 12 Oct 2020 17:30:51 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3C4CE42040F;
	Mon, 12 Oct 2020 17:30:51 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2A5E84202B6
	for <drbd-dev@lists.linbit.com>; Mon, 12 Oct 2020 17:29:19 +0200 (CEST)
Received: by mail-ed1-f67.google.com with SMTP id dn5so17383079edb.10
	for <drbd-dev@lists.linbit.com>; Mon, 12 Oct 2020 08:29:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:from:to:cc:subject:date:message-id;
	bh=4LxCOpJ34UEMOBWkh8+Qd4/nYkwxlUMOcW4tVHmz9HQ=;
	b=rcJERnSwEFNOK7Ovo6xXtp4YfLAp3T+5u/dRzAY81anChoX70hrQGC9GW01bNJdcCo
	iJdHjM92BeDQR1TcJaJHzf+tHL36BNzPG4Dk7TWI9/u3OhWYgM5StDwQtHI0Dtn21L12
	RpqKLWem3LYiN26eGyeD9Q9PnjZjjjcFGnLu1fxcEnzmXPxJl43HyS7S0GDxhmRgvdar
	T9NWoyhBW6kW1hBBVKxbSDu/FR7ocPqXdApoYtHnHoFi4Zt2c8FTq2gXbFNtPOA26nGV
	OjPgpL+NX9EsFF5zLUe+Oi9cHufwY75JNBgp0Gc5yHCqXCodliCuNdub+hszgXmdA3v3
	7g7w==
X-Gm-Message-State: AOAM532/LUf+gCBN9frZ09brgWqQrTXzQjFCxGqCPD55p/ZhLYUKAc5w
	vkXBokgCbrPdoFP/3GAWWLDqcR+gxaz2jhQ26VQ=
X-Google-Smtp-Source: ABdhPJzBtCFEOMIQjE++wWQmhMq87Jyzv04nTQ9XLzehnAIuyt7d7bkcJE78y+iNLvYg2xYnw6IkaA==
X-Received: by 2002:aa7:cd09:: with SMTP id b9mr14592071edw.55.1602516558612; 
	Mon, 12 Oct 2020 08:29:18 -0700 (PDT)
Received: from soda.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	b25sm10704969eds.66.2020.10.12.08.29.17
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 12 Oct 2020 08:29:18 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Mon, 12 Oct 2020 17:29:16 +0200
Resent-Message-ID: <20201012152916.GK2116@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 486 seconds by postgrey-1.31 at mail19;
	Sun, 27 Sep 2020 22:04:18 CEST
Received: from mail3-relais-sop.national.inria.fr
	(mail3-relais-sop.national.inria.fr [192.134.164.104])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D923D420385
	for <drbd-dev@lists.linbit.com>; Sun, 27 Sep 2020 22:04:18 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.77,311,1596492000"; d="scan'208";a="360169486"
Received: from palace.rsr.lip6.fr (HELO palace.lip6.fr) ([132.227.105.202])
	by mail3-relais-sop.national.inria.fr with ESMTP/TLS/AES256-SHA256;
	27 Sep 2020 21:55:11 +0200
From: Julia Lawall <Julia.Lawall@inria.fr>
To: linux-iio@vger.kernel.org
Date: Sun, 27 Sep 2020 21:12:10 +0200
Message-Id: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 1.9.1
Cc: drbd-dev@lists.linbit.com,
	=?UTF-8?q?Valdis=20Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>,
	David Lechner <david@lechnology.com>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-wireless@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-block@vger.kernel.org, linux-ide@vger.kernel.org,
	linux-crypto@vger.kernel.org, Joe Perches <joe@perches.com>,
	linux-amlogic@lists.infradead.org,
	Thomas Gleixner <tglx@linutronix.de>, linux-acpi@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Jerome Brunet <jbrunet@baylibre.com>
Subject: [Drbd-dev] [PATCH 00/18] use semicolons rather than commas to
	separate statements
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

These patches replace commas by semicolons.  This was done using the
Coccinelle semantic patch (http://coccinelle.lip6.fr/) shown below.

This semantic patch ensures that commas inside for loop headers will not be
transformed.  It also doesn't touch macro definitions.

Coccinelle ensures that braces are added as needed when a single-statement
branch turns into a multi-statement one.

This semantic patch has a few false positives, for variable delcarations
such as:

LIST_HEAD(x), *y;

The semantic patch could be improved to avoid these, but for the moment
they have been removed manually (2 occurrences).

// <smpl>
@initialize:ocaml@
@@

let infunction p =
  (* avoid macros *)
  (List.hd p).current_element <> "something_else"

let combined p1 p2 =
  (List.hd p1).line_end = (List.hd p2).line ||
  (((List.hd p1).line_end < (List.hd p2).line) &&
   ((List.hd p1).col < (List.hd p2).col))

@bad@
statement S;
declaration d;
position p;
@@

S@p
d

// special cases where newlines are needed (hope for no more than 5)
@@
expression e1,e2;
statement S;
position p != bad.p;
position p1;
position p2 :
    script:ocaml(p1) { infunction p1 && combined p1 p2 };
@@

- e1@p1,@S@p e2@p2;
+ e1; e2;

@@
expression e1,e2;
statement S;
position p != bad.p;
position p1;
position p2 :
    script:ocaml(p1) { infunction p1 && combined p1 p2 };
@@

- e1@p1,@S@p e2@p2;
+ e1; e2;

@@
expression e1,e2;
statement S;
position p != bad.p;
position p1;
position p2 :
    script:ocaml(p1) { infunction p1 && combined p1 p2 };
@@

- e1@p1,@S@p e2@p2;
+ e1; e2;

@@
expression e1,e2;
statement S;
position p != bad.p;
position p1;
position p2 :
    script:ocaml(p1) { infunction p1 && combined p1 p2 };
@@

- e1@p1,@S@p e2@p2;
+ e1; e2;

@@
expression e1,e2;
statement S;
position p != bad.p;
position p1;
position p2 :
    script:ocaml(p1) { infunction p1 && combined p1 p2 };
@@

- e1@p1,@S@p e2@p2;
+ e1; e2;

@r@
expression e1,e2;
statement S;
position p != bad.p;
@@

e1 ,@S@p e2;

@@
expression e1,e2;
position p1;
position p2 :
    script:ocaml(p1) { infunction p1 && not(combined p1 p2) };
statement S;
position r.p;
@@

e1@p1
-,@S@p
+;
e2@p2
... when any
// </smpl>

---

 drivers/acpi/processor_idle.c               |    4 +++-
 drivers/ata/pata_icside.c                   |   21 +++++++++++++--------
 drivers/base/regmap/regmap-debugfs.c        |    2 +-
 drivers/bcma/driver_pci_host.c              |    4 ++--
 drivers/block/drbd/drbd_receiver.c          |    6 ++++--
 drivers/char/agp/amd-k7-agp.c               |    2 +-
 drivers/char/agp/nvidia-agp.c               |    2 +-
 drivers/char/agp/sworks-agp.c               |    2 +-
 drivers/char/hw_random/iproc-rng200.c       |    8 ++++----
 drivers/char/hw_random/mxc-rnga.c           |    6 +++---
 drivers/char/hw_random/stm32-rng.c          |    8 ++++----
 drivers/char/ipmi/bt-bmc.c                  |    6 +++---
 drivers/clk/meson/meson-aoclk.c             |    2 +-
 drivers/clk/mvebu/ap-cpu-clk.c              |    2 +-
 drivers/clk/uniphier/clk-uniphier-cpugear.c |    2 +-
 drivers/clk/uniphier/clk-uniphier-mux.c     |    2 +-
 drivers/clocksource/mps2-timer.c            |    6 +++---
 drivers/clocksource/timer-armada-370-xp.c   |    8 ++++----
 drivers/counter/ti-eqep.c                   |    2 +-
 drivers/crypto/amcc/crypto4xx_alg.c         |    2 +-
 drivers/crypto/atmel-tdes.c                 |    2 +-
 drivers/crypto/hifn_795x.c                  |    4 ++--
 drivers/crypto/talitos.c                    |    8 ++++----
 23 files changed, 60 insertions(+), 51 deletions(-)
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
