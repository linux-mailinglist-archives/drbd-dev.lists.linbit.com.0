Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qH2nFOzjx2mueQUAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Sat, 28 Mar 2026 15:21:32 +0100
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id 090C834EA7E
	for <lists+drbd-dev@lfdr.de>; Sat, 28 Mar 2026 15:21:32 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 40C301627B2;
	Sat, 28 Mar 2026 15:21:20 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 430 seconds by postgrey-1.31 at mail19;
	Sat, 28 Mar 2026 15:21:18 CET
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0D6A4160867
	for <drbd-dev@lists.linbit.com>; Sat, 28 Mar 2026 15:21:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
	t=1774707678; x=1806243678;
	h=date:from:to:cc:subject:message-id:references:
	mime-version:in-reply-to;
	bh=/BGl0+Oz49k5tPl3ySgr/pb+u1t6ujQqJ5mp27HxMDw=;
	b=UsMiAPRJ3JjiU3qGP9i1gmaRL172rTtVdV6wQtVXmoqzVd1N+es9nLha
	Jrm0L4Q+7ke/rFEonkem9OjAVhI+SRnTml0SfPC+HGcFauhIYFqux7QCQ
	9zXqCpsNPQOn9nqkhSzoygsT+RNFuiGMDqIUndQ9EqFXwxGJ4kDN9Yzus
	NzD2v7vwM8nBpSEZC5h3MBq5fEnTGbMtG3SjV5/GUOu0rCQMTRBghe0FT
	FcnnyzBib5v6Ecf3+V8W4N8Bq6rpKf9ZBa5RAomMjRboFygedsASf1EDj
	WwKaRdxxhz5krM2qOEIGtnGIv+owOtDhvWR56TGFhZ4PSNBoIWAM/1neu Q==;
X-CSE-ConnectionGUID: D2rddxUjSKykiOT9w/UAbw==
X-CSE-MsgGUID: 6gaXnf/pQ5epItjGVqqvRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="74794145"
X-IronPort-AV: E=Sophos;i="6.23,146,1770624000"; d="scan'208";a="74794145"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
	by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	28 Mar 2026 07:14:06 -0700
X-CSE-ConnectionGUID: xU7hdjRVT2C/niVXf//eRg==
X-CSE-MsgGUID: 43dgNcz4TJGPHkxmuhIwYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,146,1770624000"; d="scan'208";a="227187146"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2)
	([10.211.93.152])
	by fmviesa004.fm.intel.com with ESMTP; 28 Mar 2026 07:14:03 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>) id 1w6UQL-000000007gb-2MoE;
	Sat, 28 Mar 2026 14:14:01 +0000
Date: Sat, 28 Mar 2026 15:13:44 +0100
From: kernel test robot <lkp@intel.com>
To: Christoph =?iso-8859-1?Q?B=F6hmwalder?= <christoph.boehmwalder@linbit.com>,
	Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH 02/20] drbd: extend wire protocol definitions for DRBD 9
Message-ID: <202603281537.rTtvjPOL-lkp@intel.com>
References: <20260327223820.2244227-3-christoph.boehmwalder@linbit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327223820.2244227-3-christoph.boehmwalder@linbit.com>
Cc: linux-kernel@vger.kernel.org, Philipp Reisner <philipp.reisner@linbit.com>,
	linux-block@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
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
X-Spamd-Result: default: False [1.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	DMARC_POLICY_SOFTFAIL(0.10)[intel.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_NO_TLS_LAST(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:-];
	FORGED_SENDER(0.00)[lkp@intel.com,drbd-dev-bounces@lists.linbit.com];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	FORGED_RECIPIENTS(0.00)[m:christoph.boehmwalder@linbit.com,m:axboe@kernel.dk,m:linux-kernel@vger.kernel.org,m:philipp.reisner@linbit.com,m:linux-block@vger.kernel.org,m:oe-kbuild-all@lists.linux.dev,m:lars.ellenberg@linbit.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,drbd-dev-bounces@lists.linbit.com];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[drbd-dev@lists.linbit.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[drbd-dev];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 090C834EA7E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Christoph,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 67807fbaf12719fca46a622d759484652b79c7c3]

url:    https://github.com/intel-lab-lkp/linux/commits/Christoph-B-hmwalder/drbd-mark-as-BROKEN-during-DRBD-9-rework/20260328-153634
base:   67807fbaf12719fca46a622d759484652b79c7c3
patch link:    https://lore.kernel.org/r/20260327223820.2244227-3-christoph.boehmwalder%40linbit.com
patch subject: [PATCH 02/20] drbd: extend wire protocol definitions for DRBD 9
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260328/202603281537.rTtvjPOL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603281537.rTtvjPOL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_CN/networking/xfrm_proc.rst references a file that doesn't exist: Documentation/networking/xfrm_proc.rst
   Warning: Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst references a file that doesn't exist: Documentation/Configure.help
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/ABI/testing/sysfs-platform-ayaneo
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
   Warning: arch/powerpc/sysdev/mpic.c references a file that doesn't exist: Documentation/devicetree/bindings/powerpc/fsl/mpic.txt
>> Warning: drivers/block/drbd/drbd_protocol.h references a file that doesn't exist: Documentation/application-resync-synchronization.rst
   Warning: rust/kernel/sync/atomic/ordering.rs references a file that doesn't exist: srctree/tools/memory-model/Documentation/explanation.txt
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: Documentation/virtual/lguest/lguest.c
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,\b(\S*)(Documentation/[A-Za-z0-9
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: Documentation/devicetree/dt-object-internal.txt
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,^Documentation/scheduler/sched-pelt

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
