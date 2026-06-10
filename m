Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TuowDLR8KWr+XgMAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Wed, 10 Jun 2026 17:03:16 +0200
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id 270F866A878
	for <lists+drbd-dev@lfdr.de>; Wed, 10 Jun 2026 17:03:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=intel.com header.s=Intel header.b=BbXEZkz7;
	spf=pass (mail.lfdr.de: domain of drbd-dev-bounces@lists.linbit.com designates 159.69.154.96 as permitted sender) smtp.mailfrom=drbd-dev-bounces@lists.linbit.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=intel.com (policy=none)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 139AE164DA9;
	Wed, 10 Jun 2026 17:02:55 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D602116086B
	for <drbd-dev@lists.linbit.com>; Wed, 10 Jun 2026 17:02:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
	t=1781103772; x=1812639772;
	h=date:from:to:cc:subject:message-id:references:
	mime-version:content-transfer-encoding:in-reply-to;
	bh=wdD+yxiW9aVoMld4LMPC1DWLru4HtTsU9EmgfMnk6eg=;
	b=BbXEZkz7GqSS9mhfgtmeZgyESvKXNqLfi4E8pnGeTkNb/ExYpYDWCxgu
	Mr5OstrWGUlOipHWBodhRmkcID73p7wh+d2m/qsKOCKZdHJn2HviW9zM/
	Dq1DTiN8Zl9nofV4qQ5gI4TGimopcU0tjqGJ7FBqpvdWLcicwZXCvPQRO
	xkIGy4TeRHYkMkXPHOBtNn4vM31g703C66laHyUxBDc3uR6fFP+nr4PoL
	BGdawjfcHJboFM0VFUr3UKkr8xFE7BE+1izqwJF7aQAEoK7QoV5QvJCiK
	TO/B+iKlg+Q8TghqrxJUlsg0Ys6SRO0ub9+bN7GXPQ+z2IkdkaSb81Xo1 w==;
X-CSE-ConnectionGUID: de/JpPiRS0y2uy37P41ZVQ==
X-CSE-MsgGUID: T99rYay3QxaZpCvBpnw7Ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="107334589"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="107334589"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
	by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	10 Jun 2026 08:02:48 -0700
X-CSE-ConnectionGUID: vFiAK4i9TuuPvjj1ruVuyA==
X-CSE-MsgGUID: yPzj5/7BTy26oZg8/7CqtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="251275772"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
	([10.245.244.38]) by fmviesa005-auth.fm.intel.com with
	ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 08:02:35 -0700
Date: Wed, 10 Jun 2026 18:02:32 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH v2 00/14] list: Prepare entry iterators to cache cursor
	state
Message-ID: <ail8iNvPrJnE7p58@ashevche-desk.local>
References: <20260609061347.93688-1-kaitao.cheng@linux.dev>
	<bd0b7393-8ccb-4d67-8bfc-18c68347122c@amd.com>
	<5152089a-2808-4fe9-b633-b03018105dd2@linux.dev>
	<6b2efdee-95b0-4306-a682-0d0466497ddb@amd.com>
	<2399841f-d834-4652-8285-4a15c7d9a9b9@linux.dev>
	<d974a2ea-6102-45ff-bf36-3b25a2404e40@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d974a2ea-6102-45ff-bf36-3b25a2404e40@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
	krs, Bertel Jungin Aukio 5, 02600 Espoo
Cc: Muchun Song <muchun.song@linux.dev>, Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun@kernel.org>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Eddie James <eajames@linux.ibm.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	David Howells <dhowells@redhat.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>, Will Deacon <will@kernel.org>,
	linux-stm32@st-md-mailman.stormreply.com,
	drbd-dev@lists.linbit.com, Simona Vetter <simona@ffwll.ch>,
	Thierry Reding <thierry.reding@kernel.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Robert Foss <rfoss@kernel.org>, David Airlie <airlied@gmail.com>,
	Takashi Iwai <tiwai@suse.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kaito Cheng <chengkaitao@kylinos.cn>, Ingo Molnar <mingo@redhat.com>,
	Kaitao Cheng <kaitao.cheng@linux.dev>, Waiman Long <longman@redhat.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Matthew Auld <matthew.auld@intel.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>, intel-gfx@lists.freedesktop.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	linux-block@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
	linux-tegra@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
	linux1394-devel@lists.sourceforge.net,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	linux-arm-kernel@lists.infradead.org, Jens Axboe <axboe@kernel.dk>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Christian Brauner <brauner@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
	linux-spi@vger.kernel.org, Huang Rui <ray.huang@amd.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	DMARC_POLICY_SOFTFAIL(0.10)[intel.com : SPF not aligned (relaxed),none];
	RCVD_NO_TLS_LAST(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:muchun.song@linux.dev,m:peterz@infradead.org,m:boqun@kernel.org,m:joonas.lahtinen@linux.intel.com,m:eajames@linux.ibm.com,m:alexandre.torgue@foss.st.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:dhowells@redhat.com,m:ldewangan@nvidia.com,m:andrzej.hajda@intel.com,m:tursulin@ursulin.net,m:will@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:simona@ffwll.ch,m:thierry.reding@kernel.org,m:dave@stgolabs.net,m:rfoss@kernel.org,m:airlied@gmail.com,m:tiwai@suse.com,m:jernej.skrabec@gmail.com,m:jonathanh@nvidia.com,m:chengkaitao@kylinos.cn,m:mingo@redhat.com,m:kaitao.cheng@linux.dev,m:longman@redhat.com,m:philipp.reisner@linbit.com,m:luca.ceresoli@bootlin.com,m:matthew.auld@intel.com,m:matthew.brost@intel.com,m:tzimmermann@suse.de,m:paulmck@kernel.org,m:jonas@kwiboo.se,m:intel-gfx@lists.freedesktop.org,m:maarten.lankhorst@linux.intel.com,m:josh@joshtriplett.org,m:jani.nikula@linux.intel.com,m:linux-block@vg
 er.kernel.org,m:broonie@kernel.org,m:mripard@kernel.org,m:rodrigo.vivi@intel.com,m:linux-tegra@vger.kernel.org,m:perex@perex.cz,m:linux1394-devel@lists.sourceforge.net,m:lars.ellenberg@linbit.com,m:linux-arm-kernel@lists.infradead.org,m:axboe@kernel.dk,m:neil.armstrong@linaro.org,m:brauner@kernel.org,m:rdunlap@infradead.org,m:linux-sound@vger.kernel.org,m:lgirdwood@gmail.com,m:linux-spi@vger.kernel.org,m:ray.huang@amd.com,m:skomatineni@nvidia.com,m:Laurent.pinchart@ideasonboard.com,m:mcoquelin.stm32@gmail.com,m:akpm@linux-foundation.org,m:o-takashi@sakamocchi.jp,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[andriy.shevchenko@linux.intel.com,drbd-dev-bounces@lists.linbit.com];
	ASN_FAIL(0.00)[96.154.69.159.asn.rspamd.com:query timed out];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux.dev,infradead.org,kernel.org,linux.intel.com,linux.ibm.com,foss.st.com,lists.freedesktop.org,vger.kernel.org,redhat.com,nvidia.com,intel.com,ursulin.net,st-md-mailman.stormreply.com,lists.linbit.com,ffwll.ch,stgolabs.net,gmail.com,suse.com,kylinos.cn,linbit.com,bootlin.com,suse.de,kwiboo.se,joshtriplett.org,perex.cz,lists.sourceforge.net,lists.infradead.org,kernel.dk,linaro.org,amd.com,ideasonboard.com,linux-foundation.org,sakamocchi.jp];
	RSPAMD_EMAILBL_FAIL(0.00)[drbd-dev-bounces@lists.linbit.com:query timed out];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[drbd-dev@lists.linbit.com];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,drbd-dev-bounces@lists.linbit.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:-];
	RCPT_COUNT_GT_50(0.00)[61];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[drbd-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ashevche-desk.local:mid,linux.intel.com:from_mime,lists.linbit.com:from_smtp,mail19.linbit.com:rdns,mail19.linbit.com:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 270F866A878

On Wed, Jun 10, 2026 at 11:11:34AM +0200, Christian König wrote:
> On 6/10/26 10:18, Kaitao Cheng wrote:
> > 在 2026/6/10 16:07, Christian König 写道:

...

> > Should we revert to v1, or keep list_for_each_entry() and
> > list_for_each_entry_safe() as they are, close this thread, and make no
> > changes?
> > 
> > Link to v1:
> > https://lore.kernel.org/all/20260529082149.76764-1-kaitao.cheng@linux.dev/
> > 
> > Or do you have any better suggestions?
> 
> v1 looks perfectly reasonable to me.

But why not just hiding that once for all (in case they don't use the temporary
iterator)? Easy to automate, robust — everyone is happy?

> You should just include some patches in the same patch set to actually use
> the new macros.
> 
> If you modify the files under drivers/dma-buf or drivers/gpu/drm/amd to use
> the new macro I'm happy to review that.

-- 
With Best Regards,
Andy Shevchenko


