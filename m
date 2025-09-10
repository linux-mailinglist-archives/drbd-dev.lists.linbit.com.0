Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A031B51801
	for <lists+drbd-dev@lfdr.de>; Wed, 10 Sep 2025 15:35:19 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D68F916273A;
	Wed, 10 Sep 2025 15:35:02 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 6826 seconds by postgrey-1.31 at mail19;
	Wed, 10 Sep 2025 15:34:59 CEST
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 31E9C16228C
	for <drbd-dev@lists.linbit.com>; Wed, 10 Sep 2025 15:34:58 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
	SHA256) (No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 49FFB21CAA;
	Wed, 10 Sep 2025 11:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1757504471;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=nukXpjG51dnhqFzISUdKc6Tj4RBvQvnQkSubneWFZLQ=;
	b=Do8T5X9t7+rDxBdAzSuZ8cI2u5NWyCE/ajCIpCuxFECTqMvVEAkp49FtbBulrIC/QY09Hq
	2/GMaFcJS6esdGOfBbu85Mawkix1/ky0HkLBVKUnGlNervWSNhC5NudBF3aKEQZHTwx7nR
	T/pizcI+3/NXZkl+YfRgT6+Nk4+RAhk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1757504471;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=nukXpjG51dnhqFzISUdKc6Tj4RBvQvnQkSubneWFZLQ=;
	b=OMvVrlQAkYHnriEewU/AgB6bH84erNrd6ikz93vPIegO68SWH9X+dXWo2++n+uNNhAjbqk
	0nEw2QePrW1l90DA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1757504471;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=nukXpjG51dnhqFzISUdKc6Tj4RBvQvnQkSubneWFZLQ=;
	b=Do8T5X9t7+rDxBdAzSuZ8cI2u5NWyCE/ajCIpCuxFECTqMvVEAkp49FtbBulrIC/QY09Hq
	2/GMaFcJS6esdGOfBbu85Mawkix1/ky0HkLBVKUnGlNervWSNhC5NudBF3aKEQZHTwx7nR
	T/pizcI+3/NXZkl+YfRgT6+Nk4+RAhk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1757504471;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=nukXpjG51dnhqFzISUdKc6Tj4RBvQvnQkSubneWFZLQ=;
	b=OMvVrlQAkYHnriEewU/AgB6bH84erNrd6ikz93vPIegO68SWH9X+dXWo2++n+uNNhAjbqk
	0nEw2QePrW1l90DA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
	SHA256) (No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1208C13310;
	Wed, 10 Sep 2025 11:41:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA id vKBkA9djwWjhagAAD6G6ig
	(envelope-from <hare@suse.de>); Wed, 10 Sep 2025 11:41:11 +0000
Message-ID: <22b03d52-76c8-4ac6-96cf-830ec88eaef4@suse.de>
Date: Wed, 10 Sep 2025 13:41:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] md: init
	queue_limits->max_hw_wzeroes_unmap_sectors parameter
To: Zhang Yi <yi.zhang@huaweicloud.com>, linux-block@vger.kernel.org,
	linux-raid@vger.kernel.org, drbd-dev@lists.linbit.com
References: <20250910111107.3247530-1-yi.zhang@huaweicloud.com>
	<20250910111107.3247530-2-yi.zhang@huaweicloud.com>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20250910111107.3247530-2-yi.zhang@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999]; MIME_GOOD(-0.10)[text/plain];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com]; ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14]; MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:email, suse.de:mid,
	suse.de:email]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -4.30
Cc: axboe@kernel.dk, pmenzel@molgen.mpg.de, martin.petersen@oracle.com,
	john.g.garry@oracle.com, yangerkun@huawei.com,
	yi.zhang@huawei.com, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, yukuai3@huawei.com, hch@lst.de
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

On 9/10/25 13:11, Zhang Yi wrote:
> From: Zhang Yi <yi.zhang@huawei.com>
> 
> The parameter max_hw_wzeroes_unmap_sectors in queue_limits should be
> equal to max_write_zeroes_sectors if it is set to a non-zero value.
> However, the stacked md drivers call md_init_stacking_limits() to
> initialize this parameter to UINT_MAX but only adjust
> max_write_zeroes_sectors when setting limits. Therefore, this
> discrepancy triggers a value check failure in blk_validate_limits().
> 
>   $ modprobe scsi_debug num_parts=2 dev_size_mb=8 lbprz=1 lbpws=1
>   $ mdadm --create /dev/md0 --level=0 --raid-device=2 /dev/sda1 /dev/sda2
>     mdadm: Defaulting to version 1.2 metadata
>     mdadm: RUN_ARRAY failed: Invalid argument
> 
> Fix this failure by explicitly setting max_hw_wzeroes_unmap_sectors to
> max_write_zeroes_sectors. Since the linear and raid0 drivers support
> write zeroes, so they can support unmap write zeroes operation if all of
> the backend devices support it. However, the raid1/10/5 drivers don't
> support write zeroes, so we have to set it to zero.
> 
> Fixes: 0c40d7cb5ef3 ("block: introduce max_{hw|user}_wzeroes_unmap_sectors to queue limits")
> Reported-by: John Garry <john.g.garry@oracle.com>
> Closes: https://lore.kernel.org/linux-block/803a2183-a0bb-4b7a-92f1-afc5097630d2@oracle.com/
> Signed-off-by: Zhang Yi <yi.zhang@huawei.com>
> Tested-by: John Garry <john.g.garry@oracle.com>
> Reviewed-by: Li Nan <linan122@huawei.com>
> Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
> Reviewed-by: Yu Kuai <yukuai3@huawei.com>
> ---
>   drivers/md/md-linear.c | 1 +
>   drivers/md/raid0.c     | 1 +
>   drivers/md/raid1.c     | 1 +
>   drivers/md/raid10.c    | 1 +
>   drivers/md/raid5.c     | 1 +
>   5 files changed, 5 insertions(+)
> 
Notice the failure, too. Thanks for fixing it.

Reviewed-by: Hannes Reinecke <hare@suse.de>

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
