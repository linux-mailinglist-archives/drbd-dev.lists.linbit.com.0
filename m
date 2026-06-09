Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ExiHC4a7J2of1QIAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Tue, 09 Jun 2026 09:06:46 +0200
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id D57C965D0A4
	for <lists+drbd-dev@lfdr.de>; Tue, 09 Jun 2026 09:06:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=intel.com header.s=Intel header.b=loW5rAty;
	spf=pass (mail.lfdr.de: domain of drbd-dev-bounces@lists.linbit.com designates 159.69.154.96 as permitted sender) smtp.mailfrom=drbd-dev-bounces@lists.linbit.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=intel.com (policy=none)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 81957164581;
	Tue,  9 Jun 2026 09:06:34 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1AFC11627A5
	for <drbd-dev@lists.linbit.com>; Tue,  9 Jun 2026 09:06:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
	t=1780988776; x=1812524776;
	h=date:from:to:cc:subject:message-id:references:
	mime-version:in-reply-to;
	bh=wPNxaq+MxK/SZuHOphqim3jNSNXgk7q+4ZcK8M927Ho=;
	b=loW5rAtyKYPbxX0eI1Xp9xp/mK7lEUBNLJLCP7vzG527BCTEt1BW3WeN
	ceNFhyf1XPGDA+OwJPYF/qo6ltaX14lj4D8MRYMPLlVVU706rh0u3PruK
	CVE7R4hBFUBywxpGv3dPcptACOgWTJKGineAYJDmcxwRvFky3y1MCvv+T
	3wXRhqT8FkKeoWOeNzr2aKEXY5bWYAbE9BRk5WYNXxL8TyARi23doKZf3
	Y5FkpN6KR/c5fIft72LdxOdIHZTM42bdJmxD/ql1+EBlAcUP9gSLAHScv
	W6zHb45YzeR8nv7tXeSFTJhWuUoFnNbzb+dHCWIfCwo8LMCunAkqaTdED A==;
X-CSE-ConnectionGUID: i242HxJdRsWYpX4uZUYmzQ==
X-CSE-MsgGUID: kyEu4bBhTxCCNkQSdex2Gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="69275348"
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="69275348"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
	by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	09 Jun 2026 00:06:13 -0700
X-CSE-ConnectionGUID: 0Fv2wpZjRBeJ47Uck52CjA==
X-CSE-MsgGUID: onLxLx0PQVGxZ3J/XwQjww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="242837949"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
	([10.245.245.39]) by fmviesa007-auth.fm.intel.com with
	ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 00:06:01 -0700
Date: Tue, 9 Jun 2026 10:05:58 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Kaitao Cheng <kaitao.cheng@linux.dev>
Subject: Re: [PATCH v2 00/14] list: Prepare entry iterators to cache cursor
	state
Message-ID: <aie7Vlcg76naApoC@ashevche-desk.local>
References: <20260609061347.93688-1-kaitao.cheng@linux.dev>
	<aie299WveL1utNya@ashevche-desk.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aie299WveL1utNya@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
	krs, Bertel Jungin Aukio 5, 02600 Espoo
Cc: Randy Dunlap <rdunlap@infradead.org>, Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun@kernel.org>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Eddie James <eajames@linux.ibm.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
	David Howells <dhowells@redhat.com>, Huang Rui <ray.huang@amd.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, David Airlie <airlied@gmail.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	drbd-dev@lists.linbit.com, Simona Vetter <simona@ffwll.ch>,
	Thierry Reding <thierry.reding@kernel.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Robert Foss <rfoss@kernel.org>, Will Deacon <will@kernel.org>,
	Takashi Iwai <tiwai@suse.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>, linux-spi@vger.kernel.org,
	Kaito Cheng <chengkaitao@kylinos.cn>, Ingo Molnar <mingo@redhat.com>,
	Matthew Auld <matthew.auld@intel.com>, Waiman Long <longman@redhat.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Maxime Ripard <mripard@kernel.org>, linux-block@vger.kernel.org,
	Mark Brown <broonie@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	linux-tegra@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
	linux1394-devel@lists.sourceforge.net,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org, Jens Axboe <axboe@kernel.dk>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Christian Brauner <brauner@kernel.org>,
	Muchun Song <muchun.song@linux.dev>, linux-sound@vger.kernel.org,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Christian Koenig <christian.koenig@amd.com>
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
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[intel.com : SPF not aligned (relaxed),none];
	RCVD_NO_TLS_LAST(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:kaitao.cheng@linux.dev,m:rdunlap@infradead.org,m:peterz@infradead.org,m:boqun@kernel.org,m:joonas.lahtinen@linux.intel.com,m:eajames@linux.ibm.com,m:alexandre.torgue@foss.st.com,m:dri-devel@lists.freedesktop.org,m:lgirdwood@gmail.com,m:dhowells@redhat.com,m:ray.huang@amd.com,m:andrzej.hajda@intel.com,m:jonathanh@nvidia.com,m:airlied@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:simona@ffwll.ch,m:thierry.reding@kernel.org,m:dave@stgolabs.net,m:rfoss@kernel.org,m:will@kernel.org,m:tiwai@suse.com,m:jernej.skrabec@gmail.com,m:tursulin@ursulin.net,m:linux-spi@vger.kernel.org,m:chengkaitao@kylinos.cn,m:mingo@redhat.com,m:matthew.auld@intel.com,m:longman@redhat.com,m:luca.ceresoli@bootlin.com,m:matthew.brost@intel.com,m:mcoquelin.stm32@gmail.com,m:paulmck@kernel.org,m:jonas@kwiboo.se,m:linux-kernel@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:maarten.lankhorst@linux.intel.com,m:josh@joshtriplett.org,m:mripard@kernel.org,m:linux-block@vger.kernel.or
 g,m:broonie@kernel.org,m:jani.nikula@linux.intel.com,m:rodrigo.vivi@intel.com,m:linux-tegra@vger.kernel.org,m:perex@perex.cz,m:linux1394-devel@lists.sourceforge.net,m:akpm@linux-foundation.org,m:linux-arm-kernel@lists.infradead.org,m:axboe@kernel.dk,m:neil.armstrong@linaro.org,m:brauner@kernel.org,m:muchun.song@linux.dev,m:linux-sound@vger.kernel.org,m:philipp.reisner@linbit.com,m:o-takashi@sakamocchi.jp,m:ldewangan@nvidia.com,m:skomatineni@nvidia.com,m:Laurent.pinchart@ideasonboard.com,m:tzimmermann@suse.de,m:lars.ellenberg@linbit.com,m:christian.koenig@amd.com,m:jernejskrabec@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[infradead.org,kernel.org,linux.intel.com,linux.ibm.com,foss.st.com,lists.freedesktop.org,gmail.com,redhat.com,amd.com,intel.com,nvidia.com,st-md-mailman.stormreply.com,lists.linbit.com,ffwll.ch,stgolabs.net,suse.com,ursulin.net,vger.kernel.org,kylinos.cn,bootlin.com,kwiboo.se,joshtriplett.org,perex.cz,lists.sourceforge.net,linux-foundation.org,lists.infradead.org,kernel.dk,linaro.org,linux.dev,linbit.com,sakamocchi.jp,ideasonboard.com,suse.de];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	DKIM_TRACE(0.00)[intel.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andriy.shevchenko@linux.intel.com,drbd-dev-bounces@lists.linbit.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[drbd-dev@lists.linbit.com];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,drbd-dev-bounces@lists.linbit.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[61];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	TAGGED_RCPT(0.00)[drbd-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ashevche-desk.local:mid,linux.intel.com:from_mime,lists.linbit.com:from_smtp,mail19.linbit.com:rdns,mail19.linbit.com:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D57C965D0A4

On Tue, Jun 09, 2026 at 09:47:34AM +0300, Andy Shevchenko wrote:
> On Tue, Jun 09, 2026 at 02:13:33PM +0800, Kaitao Cheng wrote:
> > 
> > This series prepares for, and then updates, the list_for_each_entry()
> > family so the common entry iterators cache their next or previous cursor
> > before the loop body runs.

While code looks okay, this doesn't explain "why?" aspects.

> > The first 13 patches open-code loops that intentionally depend on the
> > old "derive the next entry from the current cursor at the end of the
> > iteration" behaviour.  These loops append work to the list being walked,
> > restart traversal after dropping a lock, skip an entry consumed by the
> > current iteration, or otherwise adjust the cursor in the loop body.
> > 
> > The final patch changes include/linux/list.h to keep a private cursor in
> > the common entry iterators while preserving the public macro interface.
> > The safe variants remain available when callers need the temporary
> > cursor explicitly or have stronger mutation requirements.
> 
> Something is really wrong with the patch series email chaining.
> Patches 3, 10, and 13 start the subthreads. Please, check your
> tools and fix them accordingly.
> 
> Note, `git format-patch ...` should not have this "side-effect"
> when used correctly.

-- 
With Best Regards,
Andy Shevchenko


