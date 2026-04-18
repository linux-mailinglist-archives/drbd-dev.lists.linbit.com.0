Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4I5aGJMK42mUBgEAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Sat, 18 Apr 2026 06:37:39 +0200
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id 0A1A141FF19
	for <lists+drbd-dev@lfdr.de>; Sat, 18 Apr 2026 06:37:38 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id EEB9916316F;
	Sat, 18 Apr 2026 06:37:25 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C104416084A
	for <drbd-dev@lists.linbit.com>; Sat, 18 Apr 2026 06:37:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
	t=1776487041; x=1808023041;
	h=date:from:to:cc:subject:message-id:references:
	mime-version:in-reply-to;
	bh=xrp5vB4dF8Q5/OFxNbUSr02qvZFZti74t7aLT7p3eAE=;
	b=SjB4/2A40ZWLrTcP34Y9NDfp3B18PncESeHOt/aoPHO39Ia4xqbCJCwo
	KnzXUKB2H1558WI3Y79PfCuIt1qSnShf2x6S2O/UY6CI1STPOeSoIydb5
	HqwoC7f4HpnuIWs36b4ddt4DgWWoBK/Y6GHnqaHsrEj08Cn+3PPZp/1xc
	dShurdvTgqXyQu40ErgcetgK7wwAE0HOkvW3o8pPhDqZbMxYDE/JgUbHM
	HrSvPtYLtFpBqLYN6W+XEPcnPxc1kmLT1eLsGniydBYIJvXDazkV/V1gj
	zKCavz4C/Fxb/6yfvM/1pQ9XURQm0LKNHpnGL+EpEQmFPooXPOHpTjm36 g==;
X-CSE-ConnectionGUID: jKJOeZTPRo6RJOHT1ck/Ag==
X-CSE-MsgGUID: bVAHVBXqSvm/znGxHPQxxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="80082670"
X-IronPort-AV: E=Sophos;i="6.23,185,1770624000"; d="scan'208";a="80082670"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
	by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	17 Apr 2026 21:37:18 -0700
X-CSE-ConnectionGUID: sa3N1YucRCijMp0yd0C09A==
X-CSE-MsgGUID: uvHzvjV5Rhy8912mKhzLKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,185,1770624000"; d="scan'208";a="228067315"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f)
	([10.211.93.152])
	by fmviesa007.fm.intel.com with ESMTP; 17 Apr 2026 21:37:16 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>) id 1wDxQf-000000001Vh-1IGK;
	Sat, 18 Apr 2026 04:37:13 +0000
Date: Sat, 18 Apr 2026 06:36:19 +0200
From: kernel test robot <lkp@intel.com>
To: Christoph =?iso-8859-1?Q?B=F6hmwalder?= <christoph.boehmwalder@linbit.com>,
	Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH 4/4] drbd: switch from genl_magic macros to YNL-generated
	code
Message-ID: <202604180607.iqIlyAER-lkp@intel.com>
References: <20260407173356.873887-5-christoph.boehmwalder@linbit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260407173356.873887-5-christoph.boehmwalder@linbit.com>
Cc: Donald Hunter <donald.hunter@gmail.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, Philipp Reisner <philipp.reisner@linbit.com>,
	linux-block@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
	oe-kbuild-all@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
	Lars Ellenberg <lars.ellenberg@linbit.com>, drbd-dev@lists.linbit.com
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
X-Spamd-Result: default: False [3.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a];
	DMARC_POLICY_SOFTFAIL(0.10)[intel.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_NO_TLS_LAST(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,linbit.com,google.com,lists.linux.dev,kernel.org,lists.linbit.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	FORGED_RECIPIENTS(0.00)[m:christoph.boehmwalder@linbit.com,m:axboe@kernel.dk,m:donald.hunter@gmail.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:philipp.reisner@linbit.com,m:linux-block@vger.kernel.org,m:edumazet@google.com,m:oe-kbuild-all@lists.linux.dev,m:kuba@kernel.org,m:lars.ellenberg@linbit.com,m:donaldhunter@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[lkp@intel.com,drbd-dev-bounces@lists.linbit.com];
	DKIM_TRACE(0.00)[intel.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,drbd-dev-bounces@lists.linbit.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[drbd-dev@lists.linbit.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.902];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	TAGGED_RCPT(0.00)[drbd-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[01.org:url,intel.com:mid,intel.com:email,mail19.linbit.com:helo,mail19.linbit.com:rdns]
X-Rspamd-Queue-Id: 0A1A141FF19
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Christoph,

kernel test robot noticed the following build errors:

[auto build test ERROR on a9c4b1d37622ed01b75f94a4f68cf55f33153a31]

url:    https://github.com/intel-lab-lkp/linux/commits/Christoph-B-hmwalder/drbd-move-UAPI-headers-to-include-uapi-linux/20260417-214347
base:   a9c4b1d37622ed01b75f94a4f68cf55f33153a31
patch link:    https://lore.kernel.org/r/20260407173356.873887-5-christoph.boehmwalder%40linbit.com
patch subject: [PATCH 4/4] drbd: switch from genl_magic macros to YNL-generated code
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260418/202604180607.iqIlyAER-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260418/202604180607.iqIlyAER-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604180607.iqIlyAER-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> ./usr/include/linux/drbd.h:18:10: fatal error: sys/types.h: No such file or directory
      18 | #include <sys/types.h>
         |          ^~~~~~~~~~~~~
   compilation terminated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
