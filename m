Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IehLJhl4KWpWXQMAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Wed, 10 Jun 2026 16:43:37 +0200
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id 3097466A568
	for <lists+drbd-dev@lfdr.de>; Wed, 10 Jun 2026 16:43:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=intel.com header.s=Intel header.b=QzuIHalm;
	spf=pass (mail.lfdr.de: domain of drbd-dev-bounces@lists.linbit.com designates 159.69.154.96 as permitted sender) smtp.mailfrom=drbd-dev-bounces@lists.linbit.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=intel.com (policy=none)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 818FB160878;
	Wed, 10 Jun 2026 16:43:35 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A350116086B
	for <drbd-dev@lists.linbit.com>; Wed, 10 Jun 2026 16:43:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
	t=1781102612; x=1812638612;
	h=date:from:to:cc:subject:message-id:references:
	mime-version:content-transfer-encoding:in-reply-to;
	bh=DPrzoI0Cic4lctVW9xW26ap2kbgPfsaWv6mpsae+kMQ=;
	b=QzuIHalm2O7H3Ljf5PFJZzSvAG2+z3PonjyYMpusRSm0T0pNVgqVfk9I
	jvRfNTOe7G4ma/sW/czSU4/ptsiykn7PUt7+ge0dMmtEn83NFFEsHZyiP
	vI+dSqSWYwF+EJJlFST20OD2+K338mYJgubDoPqQ4N/xv24thxYrFMHrn
	ug6vXVLSAbDw+1cDLb9SFug6ux2EsPl+fWx6+p1AWm4OJwuFCk1DprHpU
	z7Gu1lUG1+vjjz/6IHdHbAyEDQQJOZHbNVHAA0G/lUL5l1ygSguclp0Yg
	ERdvmoH9oKxCIu0qWkjawj1Y9WURjICi1DzFlQLDpnkSbtlwnoeBk0SDV A==;
X-CSE-ConnectionGUID: qu9lqtkPRcSl+jlMf9mKTA==
X-CSE-MsgGUID: rjyFMKMtRZKAazsCiMr9WA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="93384024"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="93384024"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
	by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	10 Jun 2026 07:43:30 -0700
X-CSE-ConnectionGUID: 9i25flRDSViVTbAIRpyEPA==
X-CSE-MsgGUID: qyMNFvgnTEePAxuMiNBn1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="251104880"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
	([10.245.244.38]) by orviesa005-auth.jf.intel.com with
	ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 07:43:17 -0700
Date: Wed, 10 Jun 2026 17:43:14 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Kaitao Cheng <kaitao.cheng@linux.dev>
Subject: Re: [PATCH v2 00/14] list: Prepare entry iterators to cache cursor
	state
Message-ID: <ail4AvzqAOXNaU6N@ashevche-desk.local>
References: <20260609061347.93688-1-kaitao.cheng@linux.dev>
	<bd0b7393-8ccb-4d67-8bfc-18c68347122c@amd.com>
	<5152089a-2808-4fe9-b633-b03018105dd2@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5152089a-2808-4fe9-b633-b03018105dd2@linux.dev>
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
	Matthew Auld <matthew.auld@intel.com>, Waiman Long <longman@redhat.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
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
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
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
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[intel.com : SPF not aligned (relaxed),none];
	RCVD_NO_TLS_LAST(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:kaitao.cheng@linux.dev,m:muchun.song@linux.dev,m:peterz@infradead.org,m:boqun@kernel.org,m:joonas.lahtinen@linux.intel.com,m:eajames@linux.ibm.com,m:alexandre.torgue@foss.st.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:dhowells@redhat.com,m:ldewangan@nvidia.com,m:andrzej.hajda@intel.com,m:tursulin@ursulin.net,m:will@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:simona@ffwll.ch,m:thierry.reding@kernel.org,m:dave@stgolabs.net,m:rfoss@kernel.org,m:airlied@gmail.com,m:tiwai@suse.com,m:jernej.skrabec@gmail.com,m:jonathanh@nvidia.com,m:chengkaitao@kylinos.cn,m:mingo@redhat.com,m:matthew.auld@intel.com,m:longman@redhat.com,m:philipp.reisner@linbit.com,m:luca.ceresoli@bootlin.com,m:matthew.brost@intel.com,m:tzimmermann@suse.de,m:paulmck@kernel.org,m:jonas@kwiboo.se,m:intel-gfx@lists.freedesktop.org,m:maarten.lankhorst@linux.intel.com,m:josh@joshtriplett.org,m:jani.nikula@linux.intel.com,m:linux-block@vger.kernel.org,m:broonie@ker
 nel.org,m:mripard@kernel.org,m:rodrigo.vivi@intel.com,m:linux-tegra@vger.kernel.org,m:perex@perex.cz,m:linux1394-devel@lists.sourceforge.net,m:lars.ellenberg@linbit.com,m:linux-arm-kernel@lists.infradead.org,m:axboe@kernel.dk,m:neil.armstrong@linaro.org,m:brauner@kernel.org,m:rdunlap@infradead.org,m:linux-sound@vger.kernel.org,m:lgirdwood@gmail.com,m:linux-spi@vger.kernel.org,m:ray.huang@amd.com,m:skomatineni@nvidia.com,m:Laurent.pinchart@ideasonboard.com,m:mcoquelin.stm32@gmail.com,m:akpm@linux-foundation.org,m:christian.koenig@amd.com,m:o-takashi@sakamocchi.jp,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux.dev,infradead.org,kernel.org,linux.intel.com,linux.ibm.com,foss.st.com,lists.freedesktop.org,vger.kernel.org,redhat.com,nvidia.com,intel.com,ursulin.net,st-md-mailman.stormreply.com,lists.linbit.com,ffwll.ch,stgolabs.net,gmail.com,suse.com,kylinos.cn,linbit.com,bootlin.com,suse.de,kwiboo.se,joshtriplett.org,perex.cz,lists.sourceforge.net,lists.infradead.org,kernel.dk,linaro.org,amd.com,ideasonboard.com,linux-foundation.org,sakamocchi.jp];
	FORGED_SENDER(0.00)[andriy.shevchenko@linux.intel.com,drbd-dev-bounces@lists.linbit.com];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	DKIM_TRACE(0.00)[intel.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ashevche-desk.local:mid,linux.intel.com:from_mime,lists.linbit.com:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3097466A568

On Wed, Jun 10, 2026 at 02:14:06PM +0800, Kaitao Cheng wrote:
> 在 2026/6/9 18:33, Christian König 写道:
> > On 6/9/26 08:13, Kaitao Cheng wrote:
> >>
> >> This series prepares for, and then updates, the list_for_each_entry()
> >> family so the common entry iterators cache their next or previous cursor
> >> before the loop body runs.
> > 
> > Why in the world would we want to do that?
> > 
> > The safe and non-safe variants have very distinct use cases and that is completely intentional.
> > 
> > What we could improve maybe is the documentation, from my experience an astonishing large amount of people have misconceptions about the safe variants.
> > 
> >> The first 13 patches open-code loops that intentionally depend on the
> >> old "derive the next entry from the current cursor at the end of the
> >> iteration" behaviour.  These loops append work to the list being walked,
> >> restart traversal after dropping a lock, skip an entry consumed by the
> >> current iteration, or otherwise adjust the cursor in the loop body.
> > 
> > Well I have to clearly reject the changes for subsystems/components I'm maintaining, that just looks horrible to me and I clearly don't see a good reason for that.
> 
> Hi Christian and Andy Shevchenko,
> 
> Thanks for taking a look. I would like to clarify the point you raised.
> 
> The reason I started looking at this is the original motivation behind
> the _safe() variants.  They exist because some users need to remove, move
> or otherwise consume the current entry while walking the list.  In that
> case the next cursor has to be preserved before the loop body can modify
> the current entry.
> 
> The unfortunate part is that this could not be expressed with the
> existing list_for_each_entry() interface without changing its calling
> convention.  The _safe() variants had to grow an extra argument for the
> temporary cursor, and that is why we ended up with a separate family of
> macros.
> 
> But conceptually, the distinction does not have to be exposed as two
> different iterator families forever.  The difference is an implementation
> detail: whether the iterator keeps the next/previous cursor before the
> body runs.  This series makes the common list_for_each_entry() iterators
> do that internally, so the safe and non-safe forms can effectively be
> folded together, or at least the need for a separate public _safe()
> interface becomes much weaker.
> 
> There is also a usability issue with the current _safe() interface.  The
> caller is forced to define a temporary cursor outside the macro and pass
> it in, even though almost all users never use that cursor directly.  It is
> just boilerplate required by the macro implementation.  I find that
> redundant and awkward: the temporary cursor is an internal detail of the
> iteration, but every caller has to spell it out.

Ah, I think the distinct macro families is that what we want.
But the hiding of the parameter can be done inside list_for_each_*_safe().
You can do a treewide change with coccinelle.

Sorry if I didn't get the whole idea from your previous contributions.

Note, even cases that would need a temporary cursor may be switched to
new list_for_each_*_safe(), see how PCI macros for iterating over resources
are implemented (include/linux/pci.h).

> With the updated list_for_each_entry() implementation, that extra cursor
> can be kept inside the iterator itself.  Callers that only want to walk
> the list, including callers that delete or consume the current entry, no
> longer need to carry an otherwise-unused temporary variable just to make
> the macro work.
> 
> >> The final patch changes include/linux/list.h to keep a private cursor in
> >> the common entry iterators while preserving the public macro interface.
> >> The safe variants remain available when callers need the temporary
> >> cursor explicitly or have stronger mutation requirements.


-- 
With Best Regards,
Andy Shevchenko


