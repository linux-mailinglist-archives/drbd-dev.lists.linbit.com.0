Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DE3B5194F
	for <lists+drbd-dev@lfdr.de>; Wed, 10 Sep 2025 16:28:21 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 874C5162747;
	Wed, 10 Sep 2025 16:28:16 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 67C0416228C
	for <drbd-dev@lists.linbit.com>; Wed, 10 Sep 2025 16:28:12 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
	[IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
	SHA256) (No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CB90037561;
	Wed, 10 Sep 2025 11:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1757504497;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=zEnisFHsxre0EVVuo5kQHP4jaEtnqdrGoeP3qr+VY6I=;
	b=CBfNHrnb1AzuTKpJwc7FYNhnrkKQp1A/ZP1Yx2Gk5XjvFx0kGFJfa46wnj8m+Lp6TsjBT7
	nj/sftMjVjIRkqiquEk/hlSWuddFKqdCafnDhyA5DQfbH9QUTLYckuP09xzLQx5knn6DLG
	y3optX0Gj2gVYs4YM2U47yt5nnAHFoU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1757504497;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=zEnisFHsxre0EVVuo5kQHP4jaEtnqdrGoeP3qr+VY6I=;
	b=XGZKqnnoWlBqwG7aDFQw5QaBn8twtKugMzflfwMRim/+imgoA7TqNppuxgTrghmm9fRTTv
	klJ6Hhx++lwFlbCA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=TTVCxRt2;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=p9FSxy6t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1757504496;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=zEnisFHsxre0EVVuo5kQHP4jaEtnqdrGoeP3qr+VY6I=;
	b=TTVCxRt2c6UkPUQkhNvN1u6t7Lc77PymjFt6+pA1VH4vDUIIRISEI/caoYolxt46ZHpdnN
	kZdUKofZhnGdE5TRiF0Oni/fNuOKcXAafIIIo1bINCdihU//CmB3yvj0upoxztDdRIq60l
	U9TVMCZr0bMt7pTO0nI6UrUstD7HjuA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1757504496;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=zEnisFHsxre0EVVuo5kQHP4jaEtnqdrGoeP3qr+VY6I=;
	b=p9FSxy6t96ozqaO/89/SmYgrxvg770I26deqFxl9rG8FMAKZHWNOdcqB3D25ou/+LO3//+
	8QKtiI+IqnHakZBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
	SHA256) (No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A7A8313310;
	Wed, 10 Sep 2025 11:41:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA id eF9TKPBjwWgOawAAD6G6ig
	(envelope-from <hare@suse.de>); Wed, 10 Sep 2025 11:41:36 +0000
Message-ID: <a0834448-35dd-401f-8d66-a957b8e160b2@suse.de>
Date: Wed, 10 Sep 2025 13:41:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drbd: init
	queue_limits->max_hw_wzeroes_unmap_sectors parameter
To: Zhang Yi <yi.zhang@huaweicloud.com>, linux-block@vger.kernel.org,
	linux-raid@vger.kernel.org, drbd-dev@lists.linbit.com
References: <20250910111107.3247530-1-yi.zhang@huaweicloud.com>
	<20250910111107.3247530-3-yi.zhang@huaweicloud.com>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20250910111107.3247530-3-yi.zhang@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: CB90037561
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[]; RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:email,suse.de:dkim,suse.de:mid,suse.de:email];
	RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -4.51
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
> However, when the backend bdev is specified, this parameter is
> initialized to UINT_MAX during the call to blk_set_stacking_limits(),
> while only max_write_zeroes_sectors is adjusted. Therefore, this
> discrepancy triggers a value check failure in blk_validate_limits().
> 
> Since the drvd driver doesn't yet support unmap write zeroes, so fix
> this failure by explicitly setting max_hw_wzeroes_unmap_sectors to
> zero.
> 
> Fixes: 0c40d7cb5ef3 ("block: introduce max_{hw|user}_wzeroes_unmap_sectors to queue limits")
> Signed-off-by: Zhang Yi <yi.zhang@huawei.com>
> Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
> Reviewed-by: Yu Kuai <yukuai3@huawei.com>
> ---
>   drivers/block/drbd/drbd_nl.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/block/drbd/drbd_nl.c b/drivers/block/drbd/drbd_nl.c
> index e09930c2b226..91f3b8afb63c 100644
> --- a/drivers/block/drbd/drbd_nl.c
> +++ b/drivers/block/drbd/drbd_nl.c
> @@ -1330,6 +1330,7 @@ void drbd_reconsider_queue_parameters(struct drbd_device *device,
>   		lim.max_write_zeroes_sectors = DRBD_MAX_BBIO_SECTORS;
>   	else
>   		lim.max_write_zeroes_sectors = 0;
> +	lim.max_hw_wzeroes_unmap_sectors = 0;
>   
>   	if ((lim.discard_granularity >> SECTOR_SHIFT) >
>   	    lim.max_hw_discard_sectors) {
Reviewed-by: Hannes Reinecke <hare@suse.de>

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
